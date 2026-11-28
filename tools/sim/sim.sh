#!/bin/bash
# Nav2 のシミュレーションを、画面なしで起動・待機・停止するための作成時の確認用の道具。
# 手で組み立てると誤りやすい 3 点（ros2 launch 自身の PID を残す、ログの行を待つ形、
# 初期位置を移動の側の打ち切りに間に合わせる）を、決まった形にしてある（docs/verification_notes.md の「起動して確かめる」）。
#
# 使い方: tools/sim/sim.sh <作業フォルダ> <動作> [引数…]
#   start [launch の引数…]  まっさらな環境で tb3_simulation_launch.py（headless:=True use_rviz:=False）を裏で起動し、
#                            ros2 launch 自身の PID を launch.pid に、ログを launch.log に残す（前のログは launch_<時刻>.log に移す）
#   wait <正規表現> [秒]     launch.log にその行が出るまで待つ（既定 180 秒）。見つかれば終了コード 0
#   initpose <x> <y>         位置の推定の側の完了を待って /initialpose を 1 回送り、移動の側の完了（または打ち切り）を待つ
#   run <コマンド…>          作業フォルダの env.sh だけを読み込んだまっさらな環境で、コマンドを実行する
#   stop                     launch.pid の PID に SIGINT を送り、止まるのを待って、残りのプロセスを表示する
#
# env.sh が無ければ、apt の ROS 2 Jazzy を読み込み、ROS_DOMAIN_ID=${SIM_DOMAIN_ID:-74}・LOCALHOST・
# GZ_PARTITION=${SIM_PARTITION:-nav2sim}・GZ_IP=127.0.0.1 にして、ほかの ROS 2 と Gazebo のプロセスから分けたものを作る。
set -u
self=$(readlink -f "$0")
[ $# -ge 2 ] || { sed -n '6,12p' "$self"; exit 2; }
dir=$(readlink -f "$1"); act=$2; shift 2
mkdir -p "$dir"
log=$dir/launch.log
leftover='gz sim|component_container|parameter_bridge|robot_state_publisher|rviz2|ros2 launch|tail .*launch.log'

if [ ! -f "$dir/env.sh" ]; then
  cat > "$dir/env.sh" <<ENV
source /opt/ros/jazzy/setup.bash
export ROS_DOMAIN_ID=${SIM_DOMAIN_ID:-74}
export ROS_AUTOMATIC_DISCOVERY_RANGE=LOCALHOST
export GZ_PARTITION=${SIM_PARTITION:-nav2sim}
export GZ_IP=127.0.0.1
ENV
fi

waitfor() {  # $1: 正規表現、$2: 秒。見つけた行を表示する
  timeout "${2:-180}" grep -m1 -E "$1" <(tail -n +1 -F "$log" 2>/dev/null)
}

case $act in
  run)
    # exec を重ねて、呼び出したプロセスの PID のまま最後のコマンドになるようにする
    exec env -i HOME="$HOME" USER="$USER" PATH=/usr/bin:/bin TERM=dumb \
      bash -c 'source "$0"; exec "$@"' "$dir/env.sh" "$@" ;;
  start)
    [ -f "$log" ] && mv "$log" "$dir/launch_$(date +%Y%m%d%H%M%S).log"
    date +%s > "$dir/start.txt"
    # スクリプトの中で & で裏に回すと、bash が SIGINT と SIGQUIT を無視にし、stop の SIGINT が届かなくなるので、既定に戻す
    nohup env --default-signal=INT,QUIT "$self" "$dir" run stdbuf -oL -eL ros2 launch nav2_bringup tb3_simulation_launch.py \
      headless:=True use_rviz:=False "$@" > "$log" 2>&1 &
    echo $! > "$dir/launch.pid"
    echo "起動した。PID $(cat "$dir/launch.pid")" ;;
  wait)
    waitfor "$1" "${2:-180}"; rc=$?
    echo "経過 $(( $(date +%s) - $(cat "$dir/start.txt") )) 秒"; exit $rc ;;
  initpose)
    [ $# -ge 2 ] || { echo "使い方: tools/sim/sim.sh <作業フォルダ> initpose <x> <y>"; exit 2; }
    waitfor 'lifecycle_manager_localization.*Managed nodes are active' 180 >/dev/null || { echo "位置の推定の側が完了しなかった"; exit 1; }
    "$self" "$dir" run ros2 topic pub --once /initialpose geometry_msgs/msg/PoseWithCovarianceStamped \
      "{header: {frame_id: map}, pose: {pose: {position: {x: $1, y: $2, z: 0.0}, orientation: {w: 1.0}}}}" >/dev/null 2>&1 \
      || { echo "初期位置を送れなかった"; exit 1; }
    echo "初期位置を送った（起動から $(( $(date +%s) - $(cat "$dir/start.txt") )) 秒）"
    waitfor 'lifecycle_manager_navigation.*(Managed nodes are active|Aborting)' 120 | grep -q 'Managed nodes are active' \
      && echo "移動の側が完了した" || { echo "移動の側が完了しなかった（launch.log を見る）"; exit 1; } ;;
  stop)
    pid=$(cat "$dir/launch.pid" 2>/dev/null)
    # PID が別のプロセスに使い回されていても止めないよう、送る前に、この道具で起動した ros2 launch かを確かめる
    if [ -n "$pid" ] && tr '\0' ' ' < "/proc/$pid/cmdline" 2>/dev/null | grep -q 'ros2 launch nav2_bringup tb3_simulation_launch.py'; then
      kill -INT "$pid"
      timeout 60 bash -c "while kill -0 $pid 2>/dev/null; do sleep 0.5; done"
      if kill -0 "$pid" 2>/dev/null; then
        echo "まだ動いている（PID $pid）。SIGTERM を送るかは、承認を得てから決める"
      else
        echo "launch は止まった"; rm -f "$dir/launch.pid"
      fi
    else
      echo "launch.pid の PID は、この道具で起動した ros2 launch として動いていない。何も送らない"
      rm -f "$dir/launch.pid"
    fi
    pgrep -af "$leftover" | grep -vE "pgrep|$self" || echo "残りのプロセスは無い" ;;
  *) sed -n '6,12p' "$self"; exit 2 ;;
esac
