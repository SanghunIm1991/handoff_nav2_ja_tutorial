# 用語集

Nav2 日本語ガイド（非公式・作成中）の本文に出てきた用語を、短い意味とともに並べる。各ページでも、用語が初めて出てきた場所で意味を 1 文で書いている。ここは、読み返すときに引くための一覧である。

「元の語」は、用語の元になった英語とその短い意味で、覚えるための手がかりとして書いている。

| 用語 | 元の語 | 意味 | 初出 |
| --- | --- | --- | --- |
| action | action〈行動〉 | ROS 2 で、時間のかかる依頼（目標まで行く、など）を送り、途中の経過と最後の結果を受け取る仕組み | [Quickstart の 5 節](01_quickstart.html#s5) |
| AMCL | Adaptive Monte Carlo Localization の略 | Nav2 で、レーザーで測った周囲の距離と地図を照らし合わせ、地図の上のロボットの位置を推定する node | [Quickstart の 3 節](01_quickstart.html#s3) |
| behavior | behavior〈振る舞い〉 | Nav2 の behavior_server が受け持つ動き。主な用途は、困った状況から抜け出すための動き（recovery。その場で回る・下がる・待つなど）で、それに限らず、costmap などの重い資源を共有したい動きを置ける | [Navigation Concepts の 5 節](04_navigation_concepts.html#s5) |
| behavior tree | behavior〈振る舞い〉＋ tree〈木〉 | やるべき仕事を木の形に並べて、複雑な手順を組み立てる方法。Nav2 では bt_navigator が XML で書かれた木を進める | [Navigation Concepts の 4 節](04_navigation_concepts.html#s4) |
| bind mount | bind〈結びつける〉＋ mount〈取り付ける〉 | 手元のフォルダを、Docker の container の中の別の場所に見せる仕組み。どちらから直しても同じファイルが変わる | [Dev Container の 1 節](03_devcontainer_guide.html#s1) |
| bond | bond〈きずな、結びつき〉 | Nav2 の lifecycle manager とサーバーの間のつながりを見張る仕組み。サーバーが落ちると、lifecycle manager がシステム全体を止める | [Navigation Concepts の 3 節](04_navigation_concepts.html#s3) |
| bt_navigator | behavior tree ＋ navigator〈道案内をするもの〉 | 目標を `navigate_to_pose` の action で受け取り、behavior tree に沿って各サーバーに仕事を頼む Nav2 の node | [Navigation Concepts の 1 節](04_navigation_concepts.html#s1) |
| colcon | collective construction〈まとめて組み立てる〉の略 | 複数の ROS 2 のパッケージを、依存の順にまとめてビルドする道具 | [環境構築の 5 節](00_setup.html#s5) |
| container（ROS 2） | container〈入れ物〉 | ROS 2 で、複数の node を 1 つのプロセスの中にまとめて動かす入れ物（component container）。Quickstart の launch file の既定では、Nav2 の node が `nav2_container` にまとめられる | [Quickstart の 6 節](01_quickstart.html#s6) |
| container（Docker） | container〈入れ物〉 | image を元に動かす、ほかから切り離された環境。中のプログラムからは、自分だけの OS があるように見える | [Dev Container の 1 節](03_devcontainer_guide.html#s1) |
| controller | controller〈制御するもの〉 | Nav2 で、planner の経路に沿って走るための速度の指令を、周期ごとに計算する部品。local costmap を使う | [Navigation Concepts の 5 節](04_navigation_concepts.html#s5) |
| costmap | cost〈費用。ここでは危険の度合い〉＋ map〈地図〉 | ロボットがぶつかる危険の大きさを、地図のマスごとに表したもの。Nav2 はこれを見て経路を考える | [Quickstart の 3 節](01_quickstart.html#s3) |
| costmap filter | costmap ＋ filter〈ふるい、こし器〉 | 地図に付けた印（filter mask）を読んで、場所に応じて costmap や振る舞いを変える layer。立ち入り禁止・速度の制限などに使う | [Navigation Concepts の 7 節](04_navigation_concepts.html#s7-1) |
| daemon | daemon〈守護の精霊〉。裏で動き続けるプログラムを指す | `ros2` コマンドが裏で使う、node や topic の一覧を覚えておく補助のプロセス（`_ros2_daemon`）。次のコマンドを速く動かすために、コマンドが終わっても残る | [Quickstart の 6 節](01_quickstart.html#s6) |
| dev container | development〈開発〉＋ container | 開発に要る道具と依存をすべて入れた Docker の container。設定はプロジェクトの `.devcontainer/devcontainer.json` に書く | [Dev Container の冒頭](03_devcontainer_guide.html) |
| Dockerfile | Docker ＋ file | Docker の image の作り方を、順に書いたファイル | [Dev Container の 1 節](03_devcontainer_guide.html#s1) |
| footprint | footprint〈足跡、設置面〉 | costmap が使うロボットの外形。半径 `robot_radius` の円か、点の並びの多角形で表す | [Navigation Concepts の 5 節](04_navigation_concepts.html#s5-1) |
| image | image〈像、写し〉 | Docker の container の元になる、ファイルとプログラムの一式 | [Dev Container の 1 節](03_devcontainer_guide.html#s1) |
| launch file | launch〈始動する〉＋ file〈ファイル〉 | どの node を、どの設定で起動するかを書いたファイル。`ros2 launch` で、書かれた node をまとめて起動する。Python・XML・YAML で書ける | [Quickstart の 2 節](01_quickstart.html#s2) |
| layer | layer〈層〉 | costmap を作るために重ねる 1 枚 1 枚。地図・障害物・ふくらませた値などを、それぞれの plugin が取り込む | [Navigation Concepts の 7 節](04_navigation_concepts.html#s7) |
| lifecycle manager | lifecycle ＋ manager〈管理するもの〉 | Nav2 で、各サーバー（lifecycle node）の状態を順に進めて、起動と終了を受け持つ node | [Navigation Concepts の 3 節](04_navigation_concepts.html#s3) |
| lifecycle node | lifecycle〈一生、生涯〉＋ node | 起動と終了の手順を、unconfigured・inactive・active・finalized の状態の移り変わりとして持つ ROS 2 の node。managed node とも呼ぶ | [Navigation Concepts の 3 節](04_navigation_concepts.html#s3) |
| locale | locale〈場所、地域〉 | 言語や文字の符号化など、地域ごとの設定。ROS 2 は UTF-8 の locale を前提にする | [環境構築の 3 節](00_setup.html#s3) |
| mixin | mix in〈混ぜ込む〉 | colcon で、よく使うビルドの指定に名前を付けたもの（`release`・`ccache` など） | [Dev Container の 5 節](03_devcontainer_guide.html#s5) |
| node | node〈結び目、節点〉 | ROS 2 で、1 つの役目を持つプログラムの単位 | [環境構築の 1 節](00_setup.html#s1) |
| odometry | odometry〈走った道のりを測ること〉 | 車輪の回転などから求めた、ロボットの移動量。ROS 2 では `odom` という名前の topic で流れることが多い | [Quickstart の 1 節](01_quickstart.html#s1) |
| overlay | overlay〈上に重ねるもの〉 | 元からある環境（underlay）の上に重ねて読み込む workspace。同じ名前のパッケージは overlay のものが優先される | [Local Installation の 5 節](02_local_installation.html#s5) |
| package.xml | package〈パッケージ〉＋ XML〈ファイルの書式〉 | ROS 2 のパッケージの名前・版・依存するものを書いたファイル。rosdep はこれを読んで、足りない依存を入れる | [Local Installation の 4-3 節](02_local_installation.html#s4-3) |
| particle cloud | particle〈粒子〉＋ cloud〈雲〉 | AMCL が考えている「ロボットがいるかもしれない位置」の候補の集まり。RViz では小さな矢印の群れとして描かれる | [Quickstart の 4 節](01_quickstart.html#s4) |
| planner | planner〈計画するもの〉 | Nav2 で、目標までの経路を計算する部品。global costmap を使う | [Navigation Concepts の 5 節](04_navigation_concepts.html#s5) |
| rosdep | ROS ＋ dependency〈依存〉 | ソースのパッケージが必要とするほかのパッケージを調べ、apt でまとめて入れる道具 | [環境構築の 5 節](00_setup.html#s5) |
| rosdep key | rosdep ＋ key〈鍵、見出しの名前〉 | パッケージが求めるものの名前（`package.xml` に書かれている）。rosdep が対応表で apt のパッケージの名前に置き換える | [Local Installation の 4-2 節](02_local_installation.html#s4-2) |
| plugin | plugin〈差し込むもの〉 | 実行時に読み込む部品のライブラリ。ROS 2 の pluginlib の仕組みで、Nav2 のサーバーや costmap の layer は、計算を plugin に任せる | [Navigation Concepts の 4 節](04_navigation_concepts.html#s4) |
| route | route〈道順〉 | Nav2 で、あらかじめ用意した道のグラフの上で道順を計算する部品（route_server） | [Navigation Concepts の 5 節](04_navigation_concepts.html#s5) |
| RViz | ROS visualization〈ROS の可視化〉の略 | ROS 2 のデータ（地図・ロボットの位置・経路など）を画面に描く道具 | [環境構築の 2 節](00_setup.html#s2) |
| SLAM | Simultaneous Localization and Mapping〈位置の推定と地図づくりを同時に行う〉の略 | 自分の位置を推定しながら地図を作る方法。Nav2 の既定は SLAM Toolbox | [Navigation Concepts の 6 節](04_navigation_concepts.html#s6) |
| smoother | smoother〈なめらかにするもの〉 | Nav2 で、planner の経路のぎざぎざや急な向きの変化をならす部品 | [Navigation Concepts の 5 節](04_navigation_concepts.html#s5) |
| stage | stage〈段階〉 | Dockerfile で、image を作る手順を区切った 1 つ 1 つ。前の stage の image に足していき、使う stage を選べる | [Dev Container の 4 節](03_devcontainer_guide.html#s4) |
| systemd | system ＋ daemon の d | Ubuntu で、裏で動くプログラム（Docker Engine など）を起動・管理する仕組み | [Dev Container の 3-1 節](03_devcontainer_guide.html#s3-1) |
| tf | transform〈変換〉の略 | 座標系どうしの位置関係。また、それを配る ROS 2 の仕組みと topic の名前 | [Quickstart の 1 節](01_quickstart.html#s1) |
| topic | topic〈話題〉 | ROS 2 で、node どうしが決まった型のデータを流す、名前つきの通り道 | [環境構築の 7 節](00_setup.html#s7) |
| underlay | underlay〈下に敷くもの〉 | overlay の下にある元からの環境。apt で入れた ROS 2（`/opt/ros/jazzy`）など | [Local Installation の 5 節](02_local_installation.html#s5) |
| URDF | Unified Robot Description Format の略 | ロボットの形（部品の大きさとつながり方）を記述するファイルの書式 | [Quickstart の 8 節](01_quickstart.html#s8) |
| use_sim_time | use simulation time〈シミュレーションの時刻を使う〉 | node が、シミュレーターの時計（`/clock`）を使うかどうかの設定 | [Quickstart の 8 節](01_quickstart.html#s8) |
| vcstool | version control system〈版の管理の仕組み〉＋ tool〈道具〉 | 複数の Git のリポジトリを、一覧のファイルからまとめて取得する道具。コマンドは `vcs` | [環境構築の 5 節](00_setup.html#s5) |
| volume | volume〈巻、容量〉 | Docker の container の外に置かれ、container を消しても残る保存場所 | [Dev Container の 1 節](03_devcontainer_guide.html#s1) |
| waypoint following | waypoint〈経由地〉＋ following〈たどること〉 | 複数の目的地を順に回る機能。各地点での仕事を plugin で差し込める | [Navigation Concepts の 5 節](04_navigation_concepts.html#s5-2) |
| workspace | workspace〈作業場〉 | ROS 2 のソースを置いてビルドするための決まった形のフォルダ。`src` にソースを置き、colcon が `build`・`install`・`log` を作る | [Local Installation の 2 節](02_local_installation.html#s2) |
| WSL2 | Windows Subsystem for Linux 2 の略 | Windows の中で Linux を動かす、Microsoft の仕組み。Windows 11 では、Linux の画面のアプリも開ける（WSLg） | [環境構築の 1 節](00_setup.html#s1) |
