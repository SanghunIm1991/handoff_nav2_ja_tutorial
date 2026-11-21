# 用語集

Nav2 日本語ガイド（非公式・作成中）の本文に出てきた用語を、短い意味とともに並べる。各ページでも、用語が初めて出てきた場所で意味を 1 文で書いている。ここは、読み返すときに引くための一覧である。

「元の語」は、用語の元になった英語とその短い意味で、覚えるための手がかりとして書いている。

| 用語 | 元の語 | 意味 | 初出 |
| --- | --- | --- | --- |
| action | action〈行動〉 | ROS 2 で、時間のかかる依頼（目標まで行く、など）を送り、途中の経過と最後の結果を受け取る仕組み | [Quickstart の 5 節](01_quickstart.html#s5) |
| AMCL | Adaptive Monte Carlo Localization の略 | Nav2 で、レーザーで測った周囲の距離と地図を照らし合わせ、地図の上のロボットの位置を推定する node | [Quickstart の 3 節](01_quickstart.html#s3) |
| costmap | cost〈費用。ここでは危険の度合い〉＋ map〈地図〉 | ロボットがぶつかる危険の大きさを、地図のマスごとに表したもの。Nav2 はこれを見て経路を考える | [Quickstart の 3 節](01_quickstart.html#s3) |
| launch file | launch〈始動する〉＋ file〈ファイル〉 | どの node を、どの設定で起動するかを書いたファイル。`ros2 launch` で、書かれた node をまとめて起動する。Python・XML・YAML で書ける | [Quickstart の 2 節](01_quickstart.html#s2) |
| node | node〈結び目、節点〉 | ROS 2 で、1 つの役目を持つプログラムの単位 | [Quickstart の 1 節](01_quickstart.html#s1) |
| odometry | odometry〈走った道のりを測ること〉 | 車輪の回転などから求めた、ロボットの移動量。ROS 2 では `odom` という名前の topic で流れることが多い | [Quickstart の 1 節](01_quickstart.html#s1) |
| particle cloud | particle〈粒子〉＋ cloud〈雲〉 | AMCL が考えている「ロボットがいるかもしれない位置」の候補の集まり。RViz では小さな矢印の群れとして描かれる | [Quickstart の 4 節](01_quickstart.html#s4) |
| RViz | ROS visualization〈ROS の可視化〉の略 | ROS 2 のデータ（地図・ロボットの位置・経路など）を画面に描く道具 | [Quickstart の 1 節](01_quickstart.html#s1) |
| tf | transform〈変換〉の略 | 座標系どうしの位置関係。また、それを配る ROS 2 の仕組みと topic の名前 | [Quickstart の 1 節](01_quickstart.html#s1) |
| topic | topic〈話題〉 | ROS 2 で、node どうしが決まった型のデータを流す、名前つきの通り道 | [Quickstart の 1 節](01_quickstart.html#s1) |
| use_sim_time | use simulation time〈シミュレーションの時刻を使う〉 | node が、シミュレーターの時計（`/clock`）を使うかどうかの設定 | [Quickstart の 8 節](01_quickstart.html#s8) |

---

この教材は、Nav2 の公式の文書を基にした非公式の学習教材である。作成者の指示のもとで、Anthropic の AI である Claude（Claude Code）が作成した。
