# 作業計画

この教材を作り進めるための計画。サイトには載せない（`_config.yml` の `exclude`）。決まりは `CLAUDE.md`、判断の経緯は `docs/qa_log.md` にある。

## 到達点

この教材を最後まで進んだ読者は、次のことができる。範囲（何を書くか）を決めるときの基準にする。見直したら QA 表に記録する。読者を迎えるまで（`CLAUDE.md` の「当面と読者を迎える時期」）は、サイトのトップに載せない。

1. シミュレーションの TurtleBot 3 を Nav2 で目的地まで動かせる
2. Nav2 を構成する部品（地図・自己位置推定・costmap・planner（経路計画）・controller（経路追従）・behavior tree）が何をしているかを説明できる
3. パラメータを変えて、ロボットの動きを意図どおりに調整できる
4. Python から Nav2 に指示を出すプログラムと、C++ の簡単なプラグインを書ける
5. 自分のロボットに Nav2 を組み込むための設定（URDF・TF・オドメトリ・センサー・外形）を、公式の手引きに沿って行える（公式の First-Time Robot Setup Guide と同じ `sam_bot` で練習する）

## 範囲と順番

最初の一区切り。元にする公式のページは `jazzy` ブランチ。

| 順 | ページ | 元にする公式のページ | 主に当たる到達点 | 状態 |
| --- | --- | --- | --- | --- |
| 0 | 環境構築（WSL2 → Ubuntu 24.04 → ROS 2 Jazzy） | なし（ROS 2 の公式の導入手順と WSL の公式の文書を基にする） | 1 | 未着手 |
| 1 | Quickstart | Getting Started / Quickstart | 1 | 構成案 |
| 2 | Local Installation | Getting Started / Build and Install / Local Installation | 1 | 未着手 |
| 3 | Navigation Concepts | Getting Started / Navigation Concepts（下位 6 ページ） | 2 | 未着手 |

ROS 2 の基礎は独立したページを作らず、各ページで初めて使う場面で説明する（`CLAUDE.md` の「内容の方針」）。一区切りの後の範囲は、到達点を基準に、区切りごとに決めてこの表に足す。

## Quickstart の構成案

元にする公式のページ: Getting Started / Quickstart（`jazzy`、コミット `b22554c`）。前提: 環境構築のページ。

| 節 | 中身 | 公式との違い |
| --- | --- | --- |
| 冒頭 | 製品に Nav2 を組み込もうとする開発者が、まず「何が動くのか」を見る、という物語調の導入。注記（出典・期待する結果の出どころ・Jazzy が前提） | 足す |
| 0. 学習目標と完了条件 | シミュレーションの TurtleBot 3 を、RViz で指定した目標まで動かせる | 足す |
| 1. 全体像 | Gazebo・ROS 2・Nav2・RViz の関係（インラインの SVG） | 足す |
| 2. Nav2 を入れる | apt で入れる。`apt upgrade` で版をそろえることと、版の確かめ方 | 版の注意を足す |
| 3. 起動する | `source`・`ros2 launch`・`headless` の意味をその場で説明する。起動されるもの（AMCL・Nav2・RViz など） | 用語の説明を足す |
| 4. 初期位置を与える | 2D Pose Estimate。なぜ初期位置が要るのか（AMCL の推定の出発点） | 理由を足す |
| 5. 目標を与えて動かす | Nav2 Goal。BT navigator が action で目標を受け取る | ほぼ同じ |
| 6. 何が動いていたか | `ros2 node list`・`ros2 topic list` で、起動したものを確かめる | 足す |
| 7. 止め方 | 止め方だけ。困ったときの節は、実際に困ったことが出てから作る | — |
| 末尾 | 次のページ・出典・このページの用語 | — |

RViz の操作（4 節・5 節）は、ユーザーが撮影した写真を後から差し込む。それまでは文章と SVG の模式図で説明する。

## 確認待ちの一覧

ユーザーの確認が要る重大な部分だけを載せる（`CLAUDE.md` の「役割分担」）。対象は、読者がそこで止まると先へ進めない手順と、読者の環境を壊しうる手順。

確かめたら、`[ ]` を `[x]` にする。気づいたことがあれば、項目の下に一言書く。Claude は次の作業のときに `[x]` の項目を見つけ、書かれたことをページに反映してから、項目を消す。

- [ ] 環境: Quickstart の起動（`ros2 launch nav2_bringup tb3_simulation_launch.py headless:=False`）で Gazebo と RViz2 の画面が出て、RViz2 で初期位置と目標を指定するとロボットが目標へ動く（Quickstart のページを書く前の環境の確認）

## 公開前の点検で扱う点

最初の push の前の `public-release-review` で、扱いを判断する。

- `docs/qa_log.md` の 2026-11-21 の行に、公開しない申し送り（`notes/`）の節への参照がある（環境の準備・方針の決定の行）。読む人には参照先が見えない。
- `docs/qa_log.md` の 2026-11-21 のふり返りの行に、グローバルの CLAUDE.md の節（Windows 専用の Python の節）への言及がある。作成した PC の環境に触れる、わずかな情報。
