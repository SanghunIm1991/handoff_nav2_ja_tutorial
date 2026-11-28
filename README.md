# Nav2 日本語の学習教材（非公式・作成中）

**サイト: https://sanghunim1991.github.io/handoff_nav2_ja_tutorial/**

ROS 2 でロボットを目的地まで動かすソフトウェア群 Nav2 を、自分たちの製品に組み込みたい開発者のために、公式の文書（[docs.nav2.org](https://docs.nav2.org/jazzy/) の Jazzy 版）を基に日本語で再構成した非公式の教材です。逐語の翻訳ではありません。

> [!NOTE]
> 作成中です。まだ読者の案内はしておらず、ページの中身は予告なく書き直すことがあります。

## 前提

- ROS 2 Jazzy と、Nav2 の Jazzy 版
- シミュレーターは Gazebo Harmonic
- PC は Windows 11 ＋ WSL2（Ubuntu 24.04）を主にしています

## 読み方

上のサイトをブラウザで読んでください。clone やダウンロードは要りません。このリポジトリには、サイトの原稿（直下の HTML・Markdown）と、開発の記録（`docs/`）と、作成時に確かめるための道具（`tools/`）があります。

## ライセンスと出典

- このリポジトリの内容は [Apache License 2.0](LICENSE) です。
- 原稿は [ros-navigation/docs.nav2.org](https://github.com/ros-navigation/docs.nav2.org)（Apache-2.0）の `jazzy` ブランチを基にしています。各ページの末尾に、基にした原稿とそのコミット、改変した旨を書いています。ROS 2 の文書（CC BY 4.0）などを基にした部分は、そのページの出典の注記のとおりです。
- 公式の画像・ロゴは転載していません。Nav2・TurtleBot・ROS・Gazebo・Ubuntu・Windows などの名前は、それぞれの持ち主の商標でありえます。
- 非公式の教材で、Nav2・ROS 2・Gazebo のプロジェクトや Microsoft とは関係がありません。
- この教材は、作成者の指示のもとで、Anthropic の AI である Claude（Claude Code）が作成しました。
