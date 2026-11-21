# 作業計画

この教材を作り進めるための計画。サイトには載せない（`_config.yml` の `exclude`）。決まりは `CLAUDE.md`、判断の経緯は `docs/qa_log.md` にある。

## 到達点

この教材を最後まで進んだ読者は、次のことができる。範囲（何を書くか）を決めるときの基準にする。見直したら QA 表に記録する。読者を迎えるまで（`CLAUDE.md` の「当面と読者を迎える時期」）は、サイトのトップに載せない。

1. シミュレーションの TurtleBot 3 を Nav2 で目的地まで動かせる
2. Nav2 を構成する部品（地図・自己位置推定・costmap・planner（経路計画）・controller（経路追従）・behavior tree）が何をしているかを説明できる
3. パラメータを変えて、ロボットの動きを意図どおりに調整できる
4. Python から Nav2 に指示を出すプログラムと、C++ の簡単なプラグインを書ける
5. 自分のロボットに Nav2 を組み込むための設定（URDF・tf・odometry・センサー・外形）を、公式の手引きに沿って行える（公式の First-Time Robot Setup Guide と同じ `sam_bot` で練習する）

## 範囲と順番

最初の一区切り。元にする公式のページは `jazzy` ブランチ。

| 順 | ページ | ファイル | 元にする公式のページ | 主に当たる到達点 | 状態 |
| --- | --- | --- | --- | --- | --- |
| 0 | 環境構築（WSL2 → Ubuntu 24.04 → ROS 2 Jazzy） | `00_setup.html` | なし（ROS 2 の公式の導入手順と WSL の公式の文書を基にする） | 1 | レビュー済み（ユーザーの確認待ち） |
| 1 | Quickstart | `01_quickstart.html` | Getting Started / Quickstart | 1 | レビュー済み（ユーザーの確認待ち） |
| 2 | Local Installation | `02_local_installation.html` | Getting Started / Build and Install / Local Installation | 1 | 未着手 |
| 3 | Navigation Concepts | `03_navigation_concepts.html` | Getting Started / Navigation Concepts（下位 6 ページ。分けるかは構成案のときに決める） | 2 | 未着手 |

書く順番は Quickstart を先にし、HTML のページの器をそこで決める。読む順番は表のとおり環境構築が先。ROS 2 の基礎は独立したページを作らず、各ページで初めて使う場面で説明する（`CLAUDE.md` の「内容の方針」）。一区切りの後の範囲は、到達点を基準に、区切りごとに決めてこの表に足す。

## 環境構築の構成案

元にする公式の文書（どれも CC BY 4.0。WSL のコードは MIT）:
- ROS 2: `ros2/ros2_documentation` の `jazzy`（`bb5ba42`、2026-11-19）の `source/Installation/Ubuntu-Install-Debs.rst` と、差し込まれる `_Ubuntu-Set-Locale.rst`・`_Apt-Repositories.rst`・`_Apt-Upgrade-Admonition.rst`
- Gazebo: `gazebosim/docs`（`93e26c0`、2026-11-19）の `common/ros_installation.md`
- WSL: `MicrosoftDocs/WSL`（`526e577`、2026-11-06）の `WSL/install.md`・`WSL/tutorials/gui-apps.md`

| 節 | 中身 |
| --- | --- |
| 冒頭 | 注記（公式の手順を基にした想定。出典。Jazzy が前提）。待ち時間が長いので、先に済ませておく章であること |
| 0. 学習目標と完了条件 | talker と listener がやり取りし、Gazebo が起動できる |
| 1. 全体像 | Windows 11 → WSL2 → Ubuntu 24.04 → ROS 2 Jazzy → Gazebo Harmonic の重なり。Nav2 は Quickstart の章で入れる |
| 2. WSL2 と Ubuntu 24.04 を入れる | 管理者の PowerShell で `wsl --install -d <名前>`。画面のアプリ（WSLg）と GPU のドライバ。Ubuntu を直接入れた PC では飛ばす |
| 3. Ubuntu を最新にし、locale を確かめる | — |
| 4. ROS 2 のリポジトリを足す | universe、`ros2-apt-source` |
| 5. ROS 2 Jazzy と開発の道具を入れる | `ros-jazzy-desktop`。`ros-dev-tools`（colcon・rosdep・vcstool。何のための道具で、どの章で使うかを書く） |
| 6. 環境を読み込む | `source` の意味。`~/.bashrc` に書き足すと楽になることと、書き足さない理由（ほかのプロジェクトや版との混ざり） |
| 7. 動作を確かめる | T1 で talker、T2 で listener |
| 8. Gazebo を入れて確かめる | `ros-jazzy-ros-gz` |
| 9. 製品に組み込むなら | 開発の PC（WSL）とロボットの PC（Ubuntu を直接、arm64 のことも）の違い。Jazzy のサポート期限（2029 年 5 月）を製品の計画に入れる |

## Quickstart の構成案

元にする公式のページ: Getting Started / Quickstart（`jazzy`、コミット `b22554c`）。前提: 環境構築のページ。

| 節 | 中身 | 公式との違い |
| --- | --- | --- |
| 冒頭 | 製品に Nav2 を組み込もうとする開発者が、まず「何が動くのか」を見る、という物語調の導入。注記（出典・期待する結果の出どころ・Jazzy が前提） | 足す |
| 0. 学習目標と完了条件 | シミュレーションの TurtleBot 3 を、RViz で指定した目標まで動かせる | 足す |
| 1. 全体像 | Gazebo・ROS 2・Nav2・RViz の関係（インラインの SVG） | 足す |
| 2. Nav2 を入れる | apt で入れる。`apt upgrade` で版をそろえることと、版の確かめ方 | 版の注意を足す |
| 3. 起動する | `source`・`ros2 launch`・`headless` の意味をその場で説明する。起動されるもの（AMCL・Nav2・RViz など）。移動の側は初期位置を待ち、待ちすぎると起動が打ち切られること（エラーの表示とやり直し方） | 用語の説明と打ち切りの説明を足す |
| 4. 初期位置を与える | 2D Pose Estimate。なぜ初期位置が要るのか（AMCL の推定の出発点） | 理由を足す |
| 5. 目標を与えて動かす | Nav2 Goal。BT navigator が action で目標を受け取る | ほぼ同じ |
| 6. 何が動いていたか | `ros2 node list`・`ros2 topic list` で、起動したものを確かめる。topic が抜けたときの集め直し方。`ros2 topic echo /cmd_vel --once` で速度の指令を読み、指令の段（`/cmd_vel_nav` → `/cmd_vel_smoothed` → `/cmd_vel`）を説明する | 足す |
| 7. 止め方 | 止め方と、止めるときに出るエラーの表示、残りのプロセスの確かめ方。困ったときの節は、実際に困ったことが出てから作る | 止めるときの表示を足す |
| 8. 製品に組み込むなら | Gazebo のロボット → 実機のドライバ、用意された地図 → 自分の環境の地図、RViz で手で与えた初期位置と目標 → 製品のアプリから与える | 足す |
| 末尾 | 次のページ・出典・このページの用語 | — |

RViz の操作（4 節・5 節）は、ユーザーが撮影した写真を後から差し込む。それまでは文章と SVG の模式図で説明する。

### 確かめた事実（ソースを読んで確認）

画面なしで起動して確かめた結果は、QA 表（2026-11-21 の「Quickstart の画面なしの確認」の行）と `docs/verification_notes.md` にある。

出どころ: `ros-navigation/navigation2` のタグ `1.3.14`（コミット `58e4019`）の `nav2_bringup/launch/`、`ros-navigation/nav2_minimal_turtlebot_simulation` のタグ `1.0.1`（コミット `6b64127`。Apache 2.0）の `nav2_minimal_tb3_sim/`。どちらも手元に入っている版と同じ番号。

- `tb3_simulation_launch.py` の主な引数と既定値: `headless`=True（True なら Gazebo はサーバー〈`gz sim -s`〉だけで、画面〈`-g`〉は False のときだけ起動）、`use_rviz`=True、`autostart`=true（RViz の Startup を押さなくても動き出す）、`use_composition`=True（Nav2 の node を 1 つの container `component_container_isolated` にまとめる）、`slam`=False、`map`=`nav2_bringup/maps/tb3_sandbox.yaml`、`params_file`=`nav2_bringup/params/nav2_params.yaml`、`world`=`tb3_sandbox.sdf.xacro`、`robot_name`=`turtlebot3_waffle`、初期の置き場所 (x, y)=(-2.00, -0.50)。
- 起動されるもの: Gazebo（サーバーと、`headless:=False` なら画面）、ロボットの出現（`ros_gz_sim` の `create`）、Gazebo と ROS 2 の橋渡し（`ros_gz_bridge` の `parameter_bridge`）、`robot_state_publisher`、RViz（`rviz_launch.py`）、Nav2 の本体（`bringup_launch.py`）。
- Nav2 の本体の node: 位置の推定（`localization_launch.py`）が `map_server`・`amcl`・`lifecycle_manager_localization`。移動（`navigation_launch.py`）が `controller_server`・`smoother_server`・`planner_server`・`route_server`・`behavior_server`・`velocity_smoother`・`collision_monitor`・`bt_navigator`・`waypoint_follower`・`docking_server`・`lifecycle_manager_navigation`。
- 橋渡しの topic（Gazebo → ROS 2）: `/clock`（`rosgraph_msgs/msg/Clock`）・`joint_states`・`odom`（`nav_msgs/msg/Odometry`）・`tf`・`imu`・`scan`（`sensor_msgs/msg/LaserScan`）。（ROS 2 → Gazebo）: `cmd_vel`（`geometry_msgs/msg/Twist`）。

## トップのページ（`index.html`）に書くこと

まだ作っていない。作るときに、次をそろえる。

- 「作成中で、まだ読者の案内はしていない」旨（`CLAUDE.md` の「当面と読者を迎える時期」）
- 読む順番（範囲と順番の表）
- 期待する結果の方針（各ページでは繰り返さない）
- `# T1`・`# T2` の意味

## 確認待ちの一覧

ユーザーの確認が要る重大な部分だけを載せる（`CLAUDE.md` の「役割分担」）。対象は、読者がそこで止まると先へ進めない手順と、読者の環境を壊しうる手順。

確かめたら、`[ ]` を `[x]` にする。気づいたことがあれば、項目の下に一言書く。Claude は次の作業のときに `[x]` の項目を見つけ、書かれたことをページに反映してから、項目を消す。

- [ ] 環境: Quickstart の起動（`ros2 launch nav2_bringup tb3_simulation_launch.py headless:=False`）で Gazebo と RViz2 の画面が出て、RViz2 で初期位置と目標を指定するとロボットが目標へ動く（画面を出した形での確認。画面なしの形は確かめ済み）
- [ ] 環境構築の 2 節〜5 節・8 節: 新しい WSL のディストリビューション（または新しい PC）で、導入の手順を頭から通せるか。とくに `wsl --list --online` に `Ubuntu-24.04` があるか、初回のユーザーの作成、`ros2-apt-source` の取得、`gz sim empty.sdf` で Gazebo の画面が開くか（読者の環境を変える手順で、Claude は頭から試せないため）
- [ ] Quickstart の 2 節: `sudo apt update`・`sudo apt upgrade`・`sudo apt install …` の手順と、版の確かめ方の表示が本文と合っているか（読者の環境を変える手順のため）
- [ ] Quickstart の 3〜5 節と 7 節: 画面の表示と操作が本文と合っているか。とくに、RViz のツールバーのボタン名（「2D Pose Estimate」「Nav2 Goal」）、左下の Nav2 の欄（Startup と取り消しのボタン）、起動直後の地図の見え方、初期位置を与えた後の particle cloud と costmap、Ctrl+C で Gazebo と RViz のウィンドウが閉じること。あわせて、4 節・5 節に差し込む画面の写真を撮る（写り込みに注意）

## Pages に載せた後に確かめること

手元には Jekyll が無く、載せるまで確かめられないもの。

- 用語集（`glossary.md`）に、共通の枠 `_layouts/default.html` が当たり、帯・見出しの線・表が設計図の見た目になっているか。ページの名前（`<title>`）が「用語集」になっているか
- 各ページの `assets/site.css` の読み込みと、ページの間のリンク（`.md` へのリンクを `.html` で書いたもの）が働くか

## 公開前の点検で扱う点

最初の push の前の `public-release-review` で、扱いを判断する。

- `docs/qa_log.md` の 2026-11-21 の行に、公開しない申し送り（`notes/`）の節への参照がある（環境の準備・方針の決定の行）。読む人には参照先が見えない。
- `00_setup.html` の出典の著作者の表示（「ROS 2 の文書の寄稿者」「Gazebo の文書の寄稿者」「Microsoft とその寄稿者」）は仮の形。CC BY 4.0 の求める表示に合うよう、各リポジトリの著作権・帰属の表示を確かめて仕上げる。
- `docs/qa_log.md` の 2026-11-21 のふり返りの行に、グローバルの CLAUDE.md の節（Windows 専用の Python の節）への言及がある。作成した PC の環境に触れる、わずかな情報。
