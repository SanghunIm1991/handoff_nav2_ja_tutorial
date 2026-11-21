# 調べ方と確かめ方の知見

公式の原稿を調べるとき（`CLAUDE.md` の「進め方」の 1）と、サンプルやツールの挙動を使い捨ての環境で確かめるとき（同じく 3）の注意。サイトには載せない（`_config.yml` の `exclude`）。

## 公式の文書を調べる

- docs.ros.org と docs.nav2.org は、本文を取得できないことがある。GitHub にある原稿（`ros2/ros2_documentation`・`ros-navigation/docs.nav2.org`）を読む。
- 原稿をまとめて調べるときは、作業用の一時フォルダの空のフォルダに `git clone --depth 1 --branch jazzy --filter=blob:limit=100k <URL>` で取得する。画像を除いて全文を検索でき、基にしたコミットも `git log -1` で分かる。
- 要件や対応版は、検索の要約ではなく安定版の公式のページで確かめる。

## パッケージの版

- ROS のパッケージを追加で入れる前に、`sudo apt update` と `sudo apt upgrade` で版をそろえる（ユーザーが行う）。前に入れた Nav2 の本体を更新しないまま `ros-jazzy-nav2-bringup` などを後から足すと、新しい版の bringup と古い版の本体が混ざることがある。bringup の launch とパラメータを古い本体で読むと、食い違いで起動に失敗しうる。
- 入れた後は、Nav2 の版が 1 つにそろっているかを確かめる（`nav2-minimal-tb*` は別のリポジトリなので版の系列が違ってよい）。

```bash
dpkg-query -W -f='${Version}\n' 'ros-jazzy-nav2-*' ros-jazzy-navigation2 | cut -d- -f1 | sort | uniq -c
```

## 起動して確かめる

- **起動の形**: `ROS_AUTOMATIC_DISCOVERY_RANGE=LOCALHOST` を付け、ログは `stdbuf -oL -eL` で行ごとに出す（`timeout` で止めたときの出力の欠けを防ぐ）。止めるときは `pkill -f` ではなく PID で止める。
- **Gazebo は画面なしで動かす**: `gz sim -s` と、手で起動する `parameter_bridge` で確かめる。`GZ_IP`・`GZ_PARTITION`・`ROS_DOMAIN_ID` で、ほかのプロセスと分ける。Nav2 の `tb3_simulation_launch.py` は `headless` の既定が true（Gazebo の画面が出ない）。
- **WSL の壁時計**: 約 36 秒ごとに約 3.6 秒進むことがある。経過時間は STEADY_TIME で測り、ログの時刻の飛びを node の停止と取り違えない。Nav2 は TF の時刻と `use_sim_time` に敏感なので、特に注意する。
- **Gazebo の導入後**: `gz` が見つからないときは `source` をやり直す。vendor パッケージの中身は `find` ではなく `dpkg -L` で探す。
- **裏で起動したときの待ち方**: `source /opt/ros/jazzy/setup.bash` に十数秒かかることがある。ログを見張る処理を別に動かすときは、ログと PID のファイルができるのを待ってから見張る（先に見張ると、ファイルが無いまま終わる）。
- **Nav2 の起動の完了**: `lifecycle_manager_localization` と `lifecycle_manager_navigation` の 2 つが `Managed nodes are active` を出せば完了。移動の側は、初期位置を与えるまで完了しない。与えないまま約 85 秒たつと `Aborting bringup.` で打ち切られる（1.3.14）。画面なしで確かめるときは、位置の推定の側の完了を待って、すぐに `/initialpose` を送る。
- **topic の一覧の取りこぼし**: `ROS_AUTOMATIC_DISCOVERY_RANGE=LOCALHOST` のもとで `ros2 topic list` を既定のまま実行すると、Nav2 の container の中の node の topic が抜け、11 個だけだった。`ros2 topic list --no-daemon --spin-time 10` では 76 個出た。daemon を使わないことと待ち時間を延ばすことのどちらが効いたか、既定の discovery の設定でも起きるかは、切り分けていない。
- **止めたときの異常終了**: SIGINT で止めると、Nav2 の container が `SIGSEGV`・`exit code -6` を出して終わる（1.3.14 で 2 回とも）。プロセスは残らない。止めた後は、`gz sim`・`component_container`・`parameter_bridge`・`robot_state_publisher`・`rviz2` が残っていないかを確かめる。`ros2 node list` などが裏で起動する `_ros2_daemon` は残る作りなので、確かめた後に要らなければ、起動したときと同じ `ROS_DOMAIN_ID` を付けて `ros2 daemon stop` で止める（2026-11-21 の確認では、次のセッションの時点で残っていなかった）。
- **言語の取り違え**: rclpy の node は `qos_overrides.*` の parameter を宣言しない（C++ の node だけ）。`ros2 param list` の期待する結果で、言語を取り違えない。

## 図と作業の環境

- **SVG の図**: WSL にはレンダラが無いので、生成スクリプトと機械の点検で作る（`learning-text-authoring` スキル）。目視はユーザーに頼む。
- **Bash の作業フォルダ**: `/add-dir` で足したフォルダへ `cd` すると、今いるフォルダがそこに残る。`git -C` や絶対パスで操作する。
