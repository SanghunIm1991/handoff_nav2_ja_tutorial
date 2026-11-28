#!/bin/bash
# push の前の点検。送る範囲（origin の今のブランチから HEAD まで）について、件数だけを表示する（値は表示しない）。
# 使い方: tools/push-check.sh [リポジトリのフォルダ]（既定は今のフォルダ。~/.claude など別のリポジトリにも使える）
# 見るもの: 公開範囲、origin がローカルの祖先か（強制なしで push できるか）、送るコミット、名義が noreply でない数、
#           追加した行の中のこの PC のユーザー名・PC 名・ホームのパス・メールの形・認証情報の形。
# 名前はその場で取るので、このファイルには書かない。問題が 1 つでもあれば終了コード 1。
set -u
cd "${1:-.}" || exit 2
b=$(git branch --show-current)
[ -n "$b" ] || { echo "ブランチに居ない（detached HEAD）"; exit 1; }
echo "ブランチ: $b / 公開範囲: $(gh repo view --json visibility --jq .visibility 2>/dev/null || echo 不明)"
r=$(git ls-remote origin "refs/heads/$b" | cut -f1)
[ -n "$r" ] || { echo "origin に $b が無い（新しいブランチの push は、この点検の外）"; exit 1; }
git merge-base --is-ancestor "$r" HEAD 2>/dev/null || { echo "origin の $b が、ローカルの祖先ではない（先に取り込みが要る。強制の push はしない）"; exit 1; }
n=$(git rev-list --count "$r..HEAD")
echo "送るコミット: $n"
git log --oneline "$r..HEAD"
[ "$n" -gt 0 ] || exit 0
# サイトとリポジトリの URL の中の持ち主の名前は公開済みなので、取り除いてから探す。探す形は、このファイル自身に当たらないよう [s] のように書く
d=$(git diff "$r..HEAD" | grep '^+' | grep -v '^+++' | sed -E 's#github\.com/[A-Za-z0-9-]+#github.com/OWNER#g; s#[A-Za-z0-9-]+\.github\.io#OWNER.github.io#g')
cnt(){ printf '%s\n' "$d" | grep -ciE -- "$1" || true; }
bad=0
show(){ echo "$1: $2"; [ "$2" -eq 0 ] || bad=1; }
show "noreply でない名義" "$(git log --format='%ae%n%ce' "$r..HEAD" | grep -vc 'users.noreply.github.com' || true)"
show "ユーザー名" "$(printf '%s\n' "$d" | grep -ciF -- "$(id -un)" || true)"
show "PC 名" "$(printf '%s\n' "$d" | grep -ciF -- "$(hostname)" || true)"
show "ホームのパス" "$(cnt '/home/[a-z]|C:\\\\User[s]|/mnt/c/User[s]')"
show "メールの形" "$(printf '%s\n' "$d" | grep -E '[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[a-z]{2,}' | grep -vcE 'noreply@anthropic\.com|users\.noreply\.github\.com|@example\.invalid' || true)"
show "認証情報の形" "$(cnt 'gh[pousr]_[A-Za-z0-9]{20,}|github_pat_[A-Za-z0-9_]{20,}|Bearer [A-Za-z0-9._-]{20,}|AKIA[0-9A-Z]{16}|-----BEGIN [A-Z ]*PRIVATE KEY')"
[ "$bad" -eq 0 ] && echo "問題は 0 件" || { echo "問題がある（push しない）"; exit 1; }
