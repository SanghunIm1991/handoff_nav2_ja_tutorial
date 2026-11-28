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
| 2 | Local Installation | `02_local_installation.html` | Getting Started / Build and Install / Local Installation | 1 | レビュー済み（ユーザーの確認待ち） |
| 4 | Navigation Concepts | `04_navigation_concepts.html`（2026-11-28 に `03_` から改めた） | Getting Started / Navigation Concepts（下位 5 ページを 1 枚にまとめた） | 2 | レビュー済み（ユーザーの確認待ち） |

2 つめの区切り（2026-11-28 に決めた。公式の `docs/.nav.yml` の Getting Started の残り）。

| 順 | ページ | ファイル | 元にする公式のページ | 主に当たる到達点 | 状態 |
| --- | --- | --- | --- | --- | --- |
| 3 | Dev Container | `03_devcontainer_guide.html`（2026-11-28 に足した。このとき Navigation Concepts を `04_navigation_concepts.html` に改めた） | Getting Started / Dev Container | 1 | レビュー済み（ユーザーの確認待ち。Docker が未導入のため、3-1 節のほかは想定） |
| 5 | Nav2 Behavior Trees | `05_nav2_behavior_trees.html` | Getting Started / Nav2 Behavior Trees の `index.md`・Nav2 に特有の節・既定の木の詳しい説明 | 2 | レビュー済み（ユーザーの確認待ち） |
| 6 | 用意されている木（Provided Nav2 Behavior Trees） | `06_provided_behavior_trees.html` | Getting Started / Nav2 Behavior Trees の `trees/` の 7 本（Navigate To Pose は 1 枚めの 5 節で読み、2 枚めの表では 1 枚めへ送る） | 2 | レビュー済み（ユーザーの確認待ち） |

3 つめの区切り（2026-11-28 に決めた。Configuration & Development の First-Time Robot Setup Guide の Jazzy 向け〈新しい Gazebo の側〉の 9 ページを、公式と 1 対 1 で置く。Gazebo Classic の側のページは扱わない。案内の 2 ページ〈`first_time_robot_setup_guide/index.md`・`gazebo/index.md`〉は、7 の冒頭で扱う）。ファイル名は原稿のファイル名から付ける。原稿が使う `sam_bot_description` は `ros-navigation/navigation2_tutorials` の `jazzy` ブランチにある。

| 順 | ページ | ファイル | 元にする公式のページ | 主に当たる到達点 | 状態 |
| --- | --- | --- | --- | --- | --- |
| 7 | Setting Up Transformations | `07_setup_transforms.html` | First-Time Robot Setup Guide / Setting Up Transformations（と案内の 2 ページ） | 5 | レビュー済み（ユーザーの確認待ち） |
| 8 | Setting Up The URDF | `08_setup_urdf.html` | 同 / Setting Up The URDF | 5 | 未着手 |
| 9 | Setting Up The SDF | `09_setup_sdf.html` | 同 / Setting Up The SDF - Gazebo | 5 | 未着手 |
| 10 | Setting Up Odometry | `10_setup_odom_gz.html` | 同 / Setting Up Odometry - Gazebo | 5 | 未着手 |
| 11 | Smoothing Odometry using Robot Localization | `11_setup_robot_localization.html` | 同 / Smoothing Odometry using Robot Localization | 5 | 未着手 |
| 12 | Setting Up Sensors | `12_setup_sensors_gz.html` | 同 / Setting Up Sensors - Gazebo | 5 | 未着手 |
| 13 | Mapping and Localization | `13_mapping_localization.html` | 同 / Mapping and Localization | 5・2 | 未着手 |
| 14 | Setting Up the Robot's Footprint | `14_setup_footprint.html` | 同 / Setting Up the Robot's Footprint | 5 | 未着手 |
| 15 | Setting Up Navigation Plugins | `15_setup_navigation_plugins.html` | 同 / Setting Up Navigation Plugins | 5・3 | 未着手 |

書く順番は Quickstart を先にし、HTML のページの器をそこで決める。読む順番は表のとおり環境構築が先。ROS 2 の基礎は独立したページを作らず、各ページで初めて使う場面で説明する（`CLAUDE.md` の「内容の方針」）。一区切りの後の範囲は、公式の原稿の `docs/.nav.yml` の並びを基本にし、到達点で過不足を見て、区切りごとにユーザーに確かめてこの表に足す（2026-11-28）。2 つめの区切りより後は、Configuration & Development を公式の順（First-Time Robot Setup Guide → Navigation Plugins → Configuration Guide → Tuning Guide → Simple Commander API）に進める予定で、Tutorials は関係する章の後に差し込む。

今の状態（2026-11-28）: 最初の一区切りの 4 ページと Dev Container の章を Pages に載せた（push の状態は `git status` で確かめる）。Nav2 Behavior Trees は 2 ページに分けると決め（QA 表の 2026-11-28 の構成案の行）、1 枚め `05_nav2_behavior_trees.html` の実習（`behavior_tree` の欄で木を切り替える）を画面なしで確かめた（結果は QA 表の「Nav2 Behavior Trees の確認」の行、表示の控えは `notes/outputs/05_nav2_behavior_trees/` の `launch.log`・`goal_*.txt`）。`05_nav2_behavior_trees.html` を書き、2 回のレビューに対応した（QA 表の「Nav2 Behavior Trees のレビュー」の行）。シミュレーションを起動して確かめるときは `tools/sim/sim.sh`（`docs/verification_notes.md` の「起動して確かめる」）を使い、承認の一覧もその動作で書く。2 枚め `06_provided_behavior_trees.html` は、構成案を決め（下の「2 枚めの構成案」）、3 節の実習（`navigate_through_poses` に経由点を送る）を画面なしで確かめ（QA 表の「用意されている木の確認」の行、控えは `notes/outputs/06_provided_behavior_trees/`）、書き、2 回のレビューに対応した（QA 表の「用意されている木のレビュー」の行）。これで 2 つめの区切り（Getting Started の残り）を書き終えた。3 つめの区切り（First-Time Robot Setup Guide の 9 ページ）の範囲を決め、範囲と順番の表に足した（QA 表の 2026-11-28 の「3 つめの区切りの範囲」の行）。7 `07_setup_transforms.html` は、構成案を作り（下の「First-Time Robot Setup Guide の構成案」）、3 節の実習を画面なしで確かめ（QA 表の 07 の「確認」の行、控えは `notes/outputs/07_setup_transforms/`）、書き、2 回のレビューに対応した（QA 表の 07 の「レビュー」の行）。次は、8 `08_setup_urdf.html` の構成案を作る。確認待ちの一覧と「Pages に載せた後に確かめること」には、ユーザーの印や指摘はまだ無い。

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

## Dev Container の構成案

元にする公式のページ: Getting Started / Dev Container（`index.md` と `devcontainer_guide.md`。`jazzy`、`b22554c`）。Docker の導入は Build and Install / Docker Installation（同じコミット）の要点だけを使う。照合に使う設定: `ros-navigation/navigation2` の `jazzy`（`c7046550`）の `.devcontainer/` と `Dockerfile`。前提: Local Installation のページ（`~/nav2_ws/src/navigation2` を clone 済み）。

調べて分かったこと（構成に効くもの）:
- 既定の `devcontainer.json` は `Dockerfile` の `dever` の段を使い、`ghcr.io/ros-navigation/navigation2:jazzy` を `cacheFrom` にする。`dever` の元の `builder` の段は、underlay（`nav2_minimal_turtlebot_simulation`）と overlay の依存を rosdep で入れるので、Gazebo（`ros_gz_sim` の依存）は image に入りうる（未確認）。ただし既定の `devcontainer.json` には画面を出すための設定が無く、画面を見る `visualizer` の段は Gazebo Classic（gzweb・`gzserver`）を前提にしている。
- `onCreateCommand` で、container の中の overlay（`/opt/overlay_ws`）の全体をビルドする。初回は 30 分を超えうる。overlay と ccache は名前付きの volume に置かれ、container を作り直しても残る。
- `runArgs` の `--network=host`・`--ipc=host`・`--privileged` などは、既定ではコメントにしてある（container の外と混線しないように）。
- 自動で入る拡張機能に `GitHub.copilot`（外部と通信する AI の機能）がある。
- `Dockerfile` の `builder` の段で `RTI_NC_LICENSE_ACCEPTED=yes` として、RTI Connext のライセンスへの同意を自動で済ませている。
- 今の環境には Docker が無い（VS Code は Windows の側にある）。

決めたこと（2026-11-28）: Docker は WSL の Ubuntu に Docker Engine を入れる手順にする（導入はユーザー）。ページは Local Installation の直後に置く。container の中で画面を出すことは説明だけにする。

| 節 | 中身 | 公式との違い |
| --- | --- | --- |
| 冒頭 | 製品の開発でチームの環境がばらつく、という物語調の導入。注記（出典・Jazzy が前提・確かめた範囲） | 足す |
| 0. 学習目標と完了条件 | VS Code で `navigation2` の `jazzy` を dev container で開き、中のターミナルで `colcon build` と `ros2` のコマンドが通る | 足す |
| 1. 全体像 | Windows の VS Code → WSL → Docker → container（`ros:jazzy` → `builder` → `dever`）、ソースの bind mount と 2 つの volume（インラインの SVG） | 足す |
| 2. dev container とは | 何か・なぜ使うか・どう動くか。Local Installation（WSL に直接入れる）との違い | 再構成 |
| 3. 準備 | WSL の Ubuntu に Docker Engine を入れる（Docker の公式の手順の要点。systemd の確かめ方）、`docker` グループの意味、VS Code の WSL と Dev Containers の拡張機能 | 足す（公式は前提として列挙するだけ） |
| 4. container で開く | `code .` → Reopen in Container。初回に起きること（image の作成、`onCreateCommand` での全体のビルド）と待ち時間、ログの見方 | 再構成 |
| 5. 中で使う | ターミナル、`/opt/overlay_ws`、一部のパッケージだけのビルド、`docker exec` で入る形と、そのとき VS Code のターミナルと環境の変数が違うこと（`devcontainer exec` は扱わないことにした） | 再構成 |
| 6. 寿命と作り直し | container は使い捨てで、volume とソースは残る。Rebuild と Without Cache。変更は `Dockerfile` と `devcontainer.json` に書く | 再構成 |
| 7. 画面と通信 | 既定の設定では画面を扱わないこと（確かめていない）。`visualizer` の段は Gazebo Classic が前提なので扱わない。`runArgs` の各項目の意味と、コメントにしてある理由 | 足す（Classic の部分は説明だけ） |
| 8. 安全のために | 信頼できるワークスペースだけ開く。自動で入る拡張機能（Copilot など）と、自動で同意しているライセンス（RTI Connext）を、開く前に確かめる | 公式の注意に、具体の確かめ所を足す |
| 9. 製品に組み込むなら | チームと CI で環境をそろえる。`docker build` と `nav2_docker` の image（Docker Installation の要点）を自社の配布に使う場合の考え方。ライセンスの確認 | 足す |
| 末尾 | 次のページ・出典・このページの用語 | — |

## Nav2 Behavior Trees の構成案

元にする公式のページ: Getting Started / Nav2 Behavior Trees（`jazzy`、`b22554c`）の 10 本の原稿（`index.md`、Nav2 に特有の節の紹介、既定の木の詳しい説明、7 つの木の例。合わせて約 1,150 行）。2 ページに分ける（2026-11-28 に決めた）。1 枚めは `05_nav2_behavior_trees.html`（Navigation Concepts と同じく、フォルダの名前を使う）で、`index.md`・Nav2 に特有の節・既定の木の詳しい説明と実習を扱う。2 枚めは `06_provided_behavior_trees.html`（木の原稿は 1 つのファイルではないので、公式の索引の見出し「Provided Nav2 Behavior Trees」から付けた）で、`trees/` の木の例を 1 つずつ説明する。木の XML は、原稿も `nav2_bt_navigator`・`nav2_behavior_tree` の `package.xml` も Apache-2.0。前提: Quickstart（シミュレーションの起動）と Navigation Concepts の 4 節（BT の基本）。主に当たる到達点: 2（behavior tree が何をしているかを説明できる）。

調べて分かったこと（根拠を添える）:
- 6 つの木の例（Navigate To Pose・Navigate Through Poses・Pause Near Goal-Obstacle・Consistent Replanning・Follow Dynamic Point・Odometry Calibration）と既定の木の詳しい説明の XML は、apt の `ros-jazzy-nav2-bt-navigator` 1.3.14 の `/opt/ros/jazzy/share/nav2_bt_navigator/behavior_trees/` の同名のファイルと、節と属性がすべて同じ（Python で XML を読んで比べた。違いは行の折り返しと見出しのコメントだけ）。
- Navigate on Route Graph with Recovery の木は、Jazzy では公式の形のまま使えない見込み。XML が apt にも `jazzy` のソースの先頭（`c7046550`）にも無く、使う節のうち `WouldARouteRecoveryHelp` が `/opt/ros/jazzy/share/nav2_behavior_tree/nav2_tree_nodes.xml` に無い（ほかの `ComputeRoute`・`ConcatenatePaths` などはある）。実際に読み込んで確かめてはいない。
- `index.md` の「とても簡単な navigator」の XML（`PipelineSequence`・`DistanceController`・`ComputePathToPose`・`FollowPath`）は、`BTCPP_format` の属性が無い。2026-11-28 に画面なしで確かめたところ、`The first tag of the XML (<root>) should contain the attribute [BTCPP_format="4"]` の知らせを出して読み込まれ、走った（QA 表の「Nav2 Behavior Trees の確認」の行。後ろ向きの目標では回復をせずに `ABORTED`）。
- 目標の型 `nav2_msgs/action/NavigateToPose` に `string behavior_tree` の欄がある（`/opt/ros/jazzy/share/nav2_msgs/action/NavigateToPose.action`）。目標ごとに木のファイルを指定できるので、設定のファイルを変えずに、自分で書いた木で走らせられる。
- 原稿の図（`assets/*.png`）は転載しない。既定の木は 30 節あり、図にするなら SVG の手描き（`svg-diagram`）の規模。

| 節 | 中身 | 公式との違い |
| --- | --- | --- |
| 冒頭 | 製品で「障害物が消えるまで待ちたい」「エレベーターを待ちたい」など、動きの手順を変えたくなる場面の物語調の導入。注記 | 足す |
| 0. 学習目標と完了条件 | 既定の木を読んで、どの順で何を試すかを説明できる。自分で書いた木の XML に切り替えて走らせ、既定の木との振る舞いの違い（回復の有無）をログで説明できる（2026-11-28 に改めた。簡単な木は、作成時の目標では失敗したため） | 足す |
| 1. 全体像 | BT の節の 4 種類（action・condition・decorator・control）と、Nav2 の木で節が action でサーバーを呼ぶこと。BT の node と ROS 2 の node・action の語の違い | 公式の warning を前に出す |
| 2. Nav2 に特有の節 | 主な action・condition・decorator と、`PipelineSequence`・`RecoveryNode`・`RoundRobin` の働き | 再構成。図は自作 |
| 3. いちばん簡単な木 | `index.md` の簡単な navigator。何が無いか（回復・再試行など） | 再構成 |
| 4. 実習: 自分の木で走らせる | Quickstart の起動 → 初期位置 → `ros2 action send_goal` で、既定の木と 3 節の木を `behavior_tree` の欄で指定して走らせ、ログの違いを見る | 足す |
| 5. 既定の木を読む | Navigate To Pose の木（詳しい説明の原稿）。航行の subtree と回復の subtree、再計画の周期、回復の順番 | 再構成 |
| 6. 次のページへ | 用意されている木の例は、次のページ（`06_provided_behavior_trees.html`）で 1 つずつ見る | — |
| 7. 製品に組み込むなら | 自社の木を作るときの考え方（既定の木から始める、木のファイルの版の管理、自作の節は plugin の章へ） | 足す |
| 末尾 | 次のページ・出典・このページの用語 | — |

2 枚め（`06_provided_behavior_trees.html`）の骨組み: 冒頭・学習目標 → 木の一覧の表（何をする木か・ファイル名・既定の木との違い。Navigate To Pose は 1 枚めの 5 節で読むので、表から 1 枚めへ送る） → 木ごとの節（Navigate Through Poses・Pause Near Goal-Obstacle・Consistent Replanning・Follow Dynamic Point・Odometry Calibration） → Route Graph の木は「Jazzy の版には入っていない」と理由を添えて一言だけ触れ、公式へリンクする → 製品に組み込むなら。実習を置くかと細部は、1 枚めを書いた後に詰める。

### 2 枚めの構成案（2026-11-28 に詰めた）

元にする原稿: `trees/` の 7 本（写しは `notes/sources/05_nav2_behavior_trees/trees_*.md`。XML の照合は `apt_1.3.14/`）。前提: 1 枚め（`05_nav2_behavior_trees.html`）。1 枚めで説明済みの節（`PipelineSequence`・`RecoveryNode`・`RoundRobin`・`GoalUpdated`・`WouldA…RecoveryHelp`・`…Selector`）は、説明を繰り返さず 1 枚めの節へ送る。

調べて分かったこと（根拠を添える）:
- Navigate Through Poses の原稿の本文は「経由点の `0.5` 以内に入ったら取り除く」と書くが、XML は `radius="0.7"`（原稿・apt 1.3.14 とも）。`0.5` は `RemovePassedGoals` の `radius` の既定値（`nav2_tree_nodes.xml`）。本文では XML の値を書き、既定値が 0.5 であることを添える。
- Navigate Through Poses の木は、`navigate_through_poses` の navigator の既定の木（`nav2_params.yaml` は `default_nav_through_poses_bt_xml` を指定せず、空なら `nav2_bt_navigator` の木を読む〈Configuration Guide の `configuring_bt_navigator.md`〉。読むファイル名は、apt の `/opt/ros/jazzy/lib/libnav2_navigate_through_poses.so` の中の文字列 `/behavior_trees/navigate_through_poses_w_replanning_and_recovery.xml` で確かめた）。目標の型 `NavigateThroughPoses` の feedback に `number_of_poses_remaining` があり、経由点を取り除いた結果を `--feedback` で見られる。
- Follow Dynamic Point の `GoalUpdater` が購読する topic は、設定 `goal_updater_topic`（既定 `goal_update`。Configuration Guide の `GoalUpdater.md` では、XML の属性とは別の Parameters の節に載る。どこに書くか〈bt_navigator の parameter か〉は確かめていない）。公式の Tutorials に、この木を使う実習（`navigation2_dynamic_point_following`）がある。木は取り消されるまで終わらず、回復の部分が無い。
- `PathLongerOnApproach` の既定は `prox_len` 3.0 m・`length_factor` 2.0（XML も同じ値）。目標の手前 3 m で、新しい経路が前の 2 倍より長くなったら、子（制御の取り消しと 5 秒の待ち）を走らせる。
- Odometry Calibration は、2 m の辺の正方形を左回りに 3 周する。Quickstart の世界（`tb3_sandbox`）の初期位置の付近には柱があり、2 m 四方の空きは無い見込み（確かめていない）。
- apt の `behavior_trees/` には、原稿で説明していない木が 6 本ある（`navigate_w_replanning_time.xml` など。`jazzy` のソースの `behavior_trees/` も同じ 12 本）。原稿に説明が無いので、ページでは一覧に名前を挙げるだけにする。

| 節 | 中身 | 公式との違い |
| --- | --- | --- |
| 冒頭 | 製品の要求（倉庫で棚を順に回る、人について行く、ゴールの前のフォークリフトが去るまで待つ）ごとに、木を選び替える、という物語調の導入。注記 | 足す |
| 0. 学習目標と完了条件 | 用意されている木から用途に合うものを選び、既定の木（Navigate To Pose）との違いを、どの節が違いを生むかで説明できる | 足す |
| 1. 木の一覧 | 表（木・ファイル名・何をする木か・既定の木との違い・使う action）。Navigate To Pose は 1 枚めへ送る。Route Graph の木は「Jazzy の版には入っていない」と理由を添えて一行。原稿で説明していない apt の木は名前だけ | 足す（公式は索引だけ） |
| 2. Navigate Through Poses | `goals` の並び、`RemovePassedGoals`（`radius` 0.7）、3 秒ごとの再計画、文脈ごとの回復。`…Selector` の節を外から切り替えるより木の中で分けるのがよい、という公式の考え | 再構成 |
| 3. 実習: 経由点を順に回る | Quickstart の起動 → 初期位置 → `ros2 action send_goal /navigate_through_poses … --feedback` で 2 つの経由点を送り、`number_of_poses_remaining` が減るのを見る（2026-11-28 に決めた。座標は確かめて選ぶ） | 足す |
| 4. Pause Near Goal-Obstacle | `MonitorAndFollowPath`（`ReactiveSequence`）、`PathLongerOnApproach` の条件、取り消して待つ流れ。障害物が去った場合と去らない場合の 2 つの結末（自作の SVG の模式図。公式の GIF と動画はリンク） | 再構成。図は自作 |
| 5. Consistent Replanning | 経路を計算し直す 3 つの条件（経路が無効・目標が更新された・10 秒たった）を、`Fallback` と `Inverter` の組み合わせで読む | 再構成 |
| 6. Follow Dynamic Point | `GoalUpdater` と `/goal_update`、`TruncatePath`（1.0 m 手前で止まる）、`KeepRunningUntilFailure`、回復が無く取り消すまで終わらないこと。実習は Tutorials の章へ送る | 再構成 |
| 7. Odometry Calibration | `DriveOnHeading` と `Spin` で正方形を 3 周する。目標を使わない木であること、広い場所が要ること | 再構成 |
| 8. 製品に組み込むなら | 木を選ぶ・組み合わせる考え方、`default_nav_through_poses_bt_xml` などで既定の木を差し替える、自作の節は plugin の章へ | 足す |
| 末尾 | 次のページ・出典・このページの用語 | — |

書いたときに変えた点（2026-11-28）: 1 節の表の最後の列は「使う action」ではなく「このページ」（どの節で読むか）にした（使う action は 2 節で書くので）。4 節の図は、2 つの結末ではなく、見張りの枝の構造の図にした（結末は 2 つの箇条書きで足り、違いを生む節の形を見せるほうが学習目標の 2 に合うため）。8 節の「自作の節は plugin の章へ」は、1 枚めの 6 節で書いたので繰り返さなかった。

## First-Time Robot Setup Guide の構成案

区切りの全体: 原稿は `docs/configuration_and_development/first_time_robot_setup_guide/`（`jazzy`、`b22554c`、2026-08-31）。原稿が導入を求めるパッケージ（`xacro`・`joint_state_publisher_gui`・`robot_localization`・`ros_gz`・`sdformat_urdf`・`slam_toolbox`）は、作成時の PC に入っている（2026-11-28、`dpkg -l` で確かめた）。読者向けの導入のコマンドは、各ページの初めて使う節に置く。

### 7 枚め: Setting Up Transformations（2026-11-28 に作った）

元にする原稿: `transformation/setup_transforms.md`（116 行）と、案内の `index.md`（47 行）・`gazebo/index.md`（76 行）。前提: Navigation Concepts の 6 節（REP 105 の木、`map`→`odom`→`base_link`→センサー、`tf2_echo`）。主に当たる到達点: 5。

調べて分かったこと:
- 4 のページの 6 節が、REP 105 の木と、誰がどのつながりを配るかと、Nav2 を起動した状態での `tf2_echo` を、すでに扱っている。7 では繰り返さず、そちらへ送る。7 で足すのは、親と子の向き（逆向きは符号が反対）、`static_transform_publisher` の実習、REP 103。
- 原稿の実習は、Nav2 もシミュレーションも使わない（`static_transform_publisher` と `tf2_echo` だけ）。`tf2_ros` と `tf2_tools`（0.36.23）は入っている。

| 節 | 中身 | 公式との違い |
| --- | --- | --- |
| 冒頭 | 自分のロボットを Nav2 に載せるには、Nav2 にロボットの形・動き・見えるものを教える必要がある、という物語調の導入。この区切り（7〜15）で `sam_bot` を一から組み立てること。注記 | 再構成（案内の 2 ページ） |
| 0. 学習目標と完了条件 | 2 つの座標系の関係を、親・子・移動量で書ける。`static_transform_publisher` で配り、`tf2_echo` で両向きを確かめられる。Nav2 が求める 3 つのつながりのうち、自分で用意するのがどれかを言える | 足す |
| 1. この区切りで作るもの | 7〜15 の流れの表（何を足すと、Nav2 に何が届くか）。`sam_bot` と、原稿のコードの在りか（`navigation2_tutorials` の `sam_bot_description`） | 再構成 |
| 2. 座標系の木 | `base_link` と `base_laser` の例。親から子への移動量 (0.1, 0, 0.2)、逆向きは符号が反対。木なので、2 つの座標系をつなぐ道は 1 つ。自作の SVG（横から見たロボットと 2 つの座標系、木） | 再構成。図は自作 |
| 3. 実習: 固定の変換を配る | T1 で `static_transform_publisher`、T2 で `tf2_echo` を両向きに。`/tf_static` を 1 回だけ見て、固定の変換がどの topic で配られるかを見る | 再構成（逆向きと `/tf_static` を足す） |
| 4. 座標系の決まり | REP 103（右手系・X が前・Z が上・SI 単位）。REP 105 は 4 のページの 6 節へ送り、Nav2 が求める 3 つのつながりと、`base_laser` は REP 105 に無い名前であること、センサーごとに `base_link` へのつながりが要ることを書く | 再構成 |
| 5. 製品に組み込むなら | 実機では `static_transform_publisher` ではなく URDF と `robot_state_publisher`（次のページ）。取り付け位置の測り誤りが、障害物の位置の誤りになる | 足す |
| 末尾 | 次のページ・出典・このページの用語 | — |

書いたときに変えた点（2026-11-28）: 0 節の学習目標 3 は「自分で用意するのがどれか」ではなく「それぞれを誰が配るのか」にした（1 回めのレビューで、odometry をロボットの側の仕事から外して読める、と指摘されたため。QA 表の 07 の 1 回めの「レビュー」の行）。1 節の表は「何を足すと Nav2 に何が届くか」ではなく「すること」の列にした（8 以降の中身を確かめる前に、Nav2 に届くものまで書くと誤りうるため）。4 節では、REP 105 を 4 のページへ送るだけにせず、3 つの座標系の意味を 1 文ずつ書いた（3 つのつながりの説明を、その場で読めるようにするため）。3 節に、回転を入れた逆向きの実習（3-5 節）を足した（学習目標 1 の「回転」に対応する実習が無く、回転があると逆向きが符号の反転だけでは済まないことを確かめられなかったため。QA 表の精査の後の「レビュー」の行）。5 節に「1 つのつながりを配るのは 1 つだけにする」を足した。

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

## Local Installation の構成案

元にする公式のページ: Getting Started / Build and Install / Local Installation（`jazzy`、コミット `b22554c`。写しは `notes/sources/index/local_installation.md`）。到達点 1（あわせて 4 のプラグインの章で使う workspace と `colcon` の下地）。前提: 環境構築・Quickstart のページ。

方針（2026-11-22 のユーザーの決定）: ソースからのビルドを主にしつつ、環境構築と Quickstart で入れ済みの部分も、導入の手順の意味となぜ要るのかを解説する。環境構築のページはコマンドを入れて道具を導入する場、このページはその意味を知る場。公式の原稿から飛躍した説明はしない。

| 節 | 中身 | 公式との違い |
| --- | --- | --- |
| 冒頭 | 注記（出典・期待する結果の出どころ・Jazzy が前提）。これまでの章で入れたものの意味を知り、Nav2 をソースからも入れる、という導入 | 足す |
| 0. 学習目標と完了条件 | 2 つの入れ方（バイナリとソース）の違いを説明できる。ソースからビルドした Nav2 を `source` して使える | 足す |
| 1. 全体像 | 公式の 2 つの節（Dependencies・Nav2 Project）と、それぞれの 2 つの入れ方の対応表。このサイトでどこまで済んでいるか | 足す |
| 2. 依存するもの | ROS 2 本体と `colcon`・`rosdep`・`vcstool` が何のために要るか（環境構築の 5 節で入れたもの）。`vcstool` は公式が依存に挙げるが、この手順では使わない（`git clone` で取る）。ROS 2 をソースから入れる方法は、公式へのリンクだけ | 意味の説明を足す |
| 3. バイナリで入れる | Quickstart の 2 節の `apt install` の意味（`navigation2`・`nav2-bringup`・`nav2-minimal-tb*` が何か。`$ROS_DISTRO`）。入っているものを確かめる | 意味の説明を足す |
| 4. ソースからビルドする | 公式のコマンドを 1 行ずつ: `NAV_DISTRO` の置き換え、workspace と `src`、`git clone --branch`、`rosdep install` の各オプション、`colcon build --symlink-install`。`slam_toolbox` の rosdep のエラーは無視してよいこと。`rosdep` を初めて使う前の `sudo rosdep init`・`rosdep update`（ROS 2 の文書の手順）。PC が固まる・ビルドが止まるときの `--executor sequential` と `MAKEFLAGS=-j1`（ROS 2 の文書の対処と、作成時の経験） | 意味の説明と、rosdep の初期化と、止まるときの対処を足す |
| 5. ビルドした Nav2 を使う | `source ~/nav2_ws/install/setup.bash` の意味。どちらの Nav2 が使われるかの確かめ方（`ros2 pkg prefix`） | 確かめ方を足す |
| 6. 製品に組み込むなら | バイナリとソースのどちらを選ぶかの考え方（公式の原稿の範囲で書く） | 足す |
| 末尾 | 次のページ・出典・このページの用語 | — |

確かめ方の案: 読み取り（入っているパッケージの版、道具の場所、`ros2 pkg prefix`）と `git clone`・`rosdep install --simulate` は Claude が試す。`sudo rosdep init` と、足りない依存を apt で入れる `rosdep install` は環境を変えるので、ユーザーが行う（2026-11-22 にユーザーがターミナルで実行して確かめたので、確認待ちの一覧には載せない）。`colcon build` は 30 分を超えうるので、ユーザーに確認してから行う。node やシミュレーションは起動しない予定。

今の環境の事実（2026-11-22）: `colcon`・`rosdep`・`vcs` は `/usr/bin` にある。`rosdep` は初期化されていない（`/etc/ros/rosdep/sources.list.d/` が無い）。同じ日に、ユーザーが `sudo rosdep init` を、Claude が `rosdep update` を実行し、足りない依存 4 つをユーザーが `rosdep install` で入れた（QA 表）。

2026-11-22 に書き、`textbook-reviewer` のレビューの指摘を直した（QA 表）。ビルドした Nav2 は、画面なしで起動し、初期位置を与えて移動の側まで起動を終えたことを確かめた（Navigation Concepts の確認の 1 回め。QA 表）。画面と RViz の操作、目標を与えて走らせることは確かめていない。

## Navigation Concepts の構成案

元にする公式のページ: Getting Started / Navigation Concepts（`jazzy`、コミット `b22554c`）の 6 つの原稿（`index.md`・`ros2.md`・`behavior_trees.md`・`navigation_servers.md`・`state_estimation.md`・`environmental_representation.md`、計約 350 行。写しは `notes/sources/04_navigation_concepts/`）。到達点 2（Nav2 の部品が何をしているかを説明できる）。前提: Quickstart（動いたものを、ここで概念として整理する）。公式の原稿には実習のコマンドが無い。

| 節 | 中身 | 元の原稿 |
| --- | --- | --- |
| 冒頭 | 注記（出典・期待する結果の出どころ・Jazzy が前提）。Quickstart で動いたものの「中で何が起きていたか」を整理する、という導入 | 足す |
| 0. 学習目標と完了条件 | 到達点 2 に沿う | 足す |
| 1. 全体像 | BT navigator が action で各サーバー（planner・controller・smoother・behavior・route）を呼び、各サーバーが costmap を持ち、lifecycle manager が全体を起動する、の 1 枚の図。Quickstart の 6 節の node の一覧と対応させる | 足す（公式の各ページの要点を 1 枚に） |
| 2. ROS 2 の仕組み: action | 長い仕事を頼む仕組み（要求・途中経過・結果）。`NavigateToPose`。クライアントの受け取り方（コールバックと future）は、C++ の文法を知る読者向けに最小限 | `ros2.md` |
| 3. ROS 2 の仕組み: lifecycle node と bond | 状態の遷移（unconfigured → inactive → active → finalized）と `on_configure`・`on_activate`。lifecycle manager と bond（落ちたら全体を止める） | `ros2.md` |
| 4. behavior tree | 有限状態機械との対比、BehaviorTree.CPP V4、XML の木と node のプラグイン、subtree として上位の木に入れられること | `behavior_trees.md` |
| 5. 各サーバー | planner・controller・smoother・behavior（recovery）・route、プラグインと名前（`FollowPath` など）、costmap を 1 つのサーバーで共有する理由、ロボットの外形（footprint）、waypoint following | `navigation_servers.md` |
| 6. 位置の推定 | REP 105 の `map` → `odom` → `base_link` → センサーの座標系。`map` → `odom` は AMCL・SLAM、`odom` → `base_link` は odometry（robot_localization で複数のセンサーを合わせる）。LIDAR は必須ではない | `state_estimation.md` |
| 7. 環境の表し方 | costmap とその層（layer）、costmap filter（立入禁止・速度制限など）、そのほかの表し方 | `environmental_representation.md` |
| 8. 製品に組み込むなら | waypoint following の 2 つの考え方（ロボットは単純で配車が賢い／ロボットが賢い）、自分のセンサーで REP 105 の座標系をそろえること、lifecycle で起動と停止を決まった順にすること | `navigation_servers.md`・`state_estimation.md`・`ros2.md` から |
| 末尾 | 次のページ・出典・このページの用語 | — |

公式の動画（Nav2 Academic Overview）と画像は載せず、リンクで案内する。BehaviorTree の本（arXiv）や REP 105 などの外部の資料は、公式と同じくリンクで案内する。

## トップのページ（`index.html`）に書くこと

2026-11-21 に作った（レビュー済み）。次の 4 つを載せている。ページを足したら、読む順番の表も直す。到達点は、読者を迎えるまで載せない。

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
- [ ] Local Installation の 5 節: `source ~/nav2_ws/install/setup.bash` の後に Quickstart の 3 節の `ros2 launch …` を実行し、ビルドした Nav2 で同じように動くこと（作成時は、画面なしで移動の側まで起動を終えたことだけを確かめた。画面と RViz の操作、目標を与えて走らせることは確かめていない）
- [ ] Navigation Concepts の 2 節・3 節: ビルドした Nav2（`~/nav2_ws` を読み込んだ環境）で起動したときも、`ros2 action list` と `ros2 lifecycle get /amcl` の表示が出ること（作成時に一度、Claude のシェルがその環境を引き継いでいた回で、`action list` が空、`lifecycle get` が `Node not found` だった。原因は確かめていない）
- [ ] Local Installation の 4-5 節: PC ごと固まったときに、Windows の PowerShell の `wsl --shutdown` で WSL を止めて戻れること（作成時は PC の再起動で戻ったため、こちらは試していない）
- [ ] Dev Container の 3-2 節〜3-3 節: Docker Engine の導入（apt の取得元を足す・`docker` グループに入れる・`wsl --shutdown` で開き直す）を通し、`systemctl status docker` と `docker run hello-world` の表示が本文と合っているか（読者の環境を変える手順で、作成時は Docker が入っていなかったため、すべて想定で書いた）
- [ ] Dev Container の 3-4 節〜6 節: VS Code の拡張機能を入れ、`code .` → Reopen in Container で、container の作成と Nav2 のビルドが終わるか。左下の表示・ログのコマンド名・5 節の `ros2 pkg prefix nav2_bringup` の表示・プロンプトが `root@…` になること・`docker exec -it nav2 bash`・6 節の `docker volume ls` の volume の名前と image の名前が本文と合っているか。ビルドで PC が固まったときに、開き直して続きから進むか（どれも想定で書いた。ビルドは 1 時間を超えうる）
- [ ] Dev Container の末尾の片付け: `docker rm -f`・`docker volume rm`・`docker image rm` で、container・volume・image が消え、ソースのフォルダが残るか（読者の環境を壊しうる手順のため）
- [ ] Nav2 Behavior Trees の 4 節: RViz の 2D Pose Estimate で初期位置を与えた状態で、4-2 節のファイルを作り、4-3〜4-5 節の `ros2 action send_goal` の表示と T1 のログが本文と合っているか（作成時は画面を出さず、初期位置をコマンドで与えて確かめた。4-4 節・4-5 節の結果は位置と向きで変わりうるので、違ったときに本文の説明で迷わないかも見る）
- [ ] 用意されている木の 3 節: RViz の 2D Pose Estimate で初期位置を与えた状態で、3-2 節の `ros2 action send_goal /navigate_through_poses … --feedback` の表示（`number_of_poses_remaining` が 2 から 1 に減る）と T1 のログが本文と合っているか（作成時は画面を出さず、初期位置をコマンドで与えて確かめた）

## Pages に載せた後に確かめること

2026-11-21 に Pages で公開し、ユーザーが確かめた（トップのページが開くこと、トップの表の後のリンクから用語集が開くこと、用語集に共通の枠が当たり `<title>` が「用語集」になること、環境構築と Quickstart の帯の色〈`assets/site.css` の読み込み〉、ライトとダークの見た目）。次はまだ確かめていない。

- ページの間のリンクの全体（`CLAUDE.md` の「ファイル名」のとおり、まとまったところで確かめる）
- docs.ros.org のリンク（`index.html` と `00_setup.html` の出典）がブラウザで開くこと（公開前の点検では、ボット対策のため GitHub の原稿の同じパスで代わりに確かめた）
- 共通の枠に足した AI の注記と商標の注記が、用語集の末尾に出ること
- 2026-11-28 に Navigation Concepts を `04_navigation_concepts.html` に改め、Dev Container（`03_devcontainer_guide.html`）を足した。トップの表・Local Installation の末尾・用語集のリンクが、新しい名前で開くこと
- `07_setup_transforms.html` の図 1（横から見たロボットと座標系の木）で、文字・線・箱が重ならず、ライトとダークの両方で点と点線が見えること（作成時の PC に図を描く道具が無く、座標と文字の幅の見積もりで重ならないことだけを確かめた。いちばん近いのは「前へ 0.1 m」とセンサーの箱、`base_link` と車輪で、間は約 4〜5）

Markdown のページや共通の枠を新しく足したら、ここに書いて、載せた後に確かめてもらう。

## 公開前の点検で扱う点

2026-11-21 の最初の push の前の `public-release-review` で、次のとおり片付けた（QA 表の同じ日の「公開前の点検」の行）。

- `docs/qa_log.md` の、公開しない申し送り（`notes/`）の節への参照と、作成した PC の環境に触れるわずかな記述は、そのまま残すと決めた。
- `00_setup.html` と `index.html` の出典の著作者の表示を、元のリポジトリの表示（ROS 2 の文書の設定の `Open Robotics`、Gazebo の文書の `Open Robotics`・`Gazebo Team`、WSL の文書のコードの `Copyright (c) Microsoft Corporation`）に合わせて仕上げた。
