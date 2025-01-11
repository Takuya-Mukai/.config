#!/bin/bash

# 必要な変数を定義
TARGET_DIR="$HOME/Documents/Obsidian/02-Daily"
DATE=$(date +%Y-%m-%d)
TIME=$(date +%H:%M)
FILENAME="${TARGET_DIR}/${DATE}.md"

# ディレクトリが存在しない場合は作成
mkdir -p "$TARGET_DIR"

# ファイルが存在しない場合は新規作成
if [[ ! -f "$FILENAME" ]]; then
    echo "# $DATE" > "$FILENAME"
fi

# Ghosttyで編集を開始、現在時刻を挿入
echo -e "$TIME " | ghostty -e bash -c "cat >> '$FILENAME'; exec bash"
