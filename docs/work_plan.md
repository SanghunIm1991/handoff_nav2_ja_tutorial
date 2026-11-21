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
| 1 | Quickstart | Getting Started / Quickstart | 1 | 未着手 |
| 2 | Local Installation | Getting Started / Build and Install / Local Installation | 1 | 未着手 |
| 3 | Navigation Concepts | Getting Started / Navigation Concepts | 2 | 未着手 |

前提の知識（ROS 2 の基礎）と環境構築（WSL2・ROS 2・Gazebo）のページの置き場所と順番は、Quickstart の構成案を作るときに決める。一区切りの後の範囲は、到達点を基準に、区切りごとに決めてこの表に足す。

## 確認待ちの一覧

ユーザーの確認が要る重大な部分だけを載せる（`CLAUDE.md` の「役割分担」）。対象は、読者がそこで止まると先へ進めない手順と、読者の環境を壊しうる手順。

確かめたら、`[ ]` を `[x]` にする。気づいたことがあれば、項目の下に一言書く。Claude は次の作業のときに `[x]` の項目を見つけ、書かれたことをページに反映してから、項目を消す。

- [ ] 環境: Quickstart の起動（`ros2 launch nav2_bringup tb3_simulation_launch.py headless:=False`）で Gazebo と RViz2 の画面が出て、RViz2 で初期位置と目標を指定するとロボットが目標へ動く（Quickstart のページを書く前の環境の確認）

## 公開前の点検で扱う点

最初の push の前の `public-release-review` で、扱いを判断する。

- `docs/qa_log.md` の 2026-11-21 の行に、公開しない申し送り（`notes/`）の節への参照がある（環境の準備・方針の決定の行）。読む人には参照先が見えない。
- `docs/qa_log.md` の 2026-11-21 のふり返りの行に、グローバルの CLAUDE.md の節（Windows 専用の Python の節）への言及がある。作成した PC の環境に触れる、わずかな情報。
