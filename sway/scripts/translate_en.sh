#!/bin/bash

# クリップボードからテキストを取得（Wayland環境）
clipboard_text=$(wl-paste)

# 空チェック
if [ -z "$clipboard_text" ]; then
    notify-send "Translation" "Clipboard is empty."
    exit 1
fi

# 翻訳
translated_text=$(trans -brief -noconfirm -no-warn-empty :ja "$clipboard_text" 2>/dev/null)

# 翻訳失敗チェック
if [ $? -ne 0 ] || [ -z "$translated_text" ]; then
    notify-send "Translation Failed" "Could not translate text."
    exit 1
fi

# 不要な行を削除
# 出力全体から "-noconfirm" を削除する
translated_text=$(echo "$translated_text" | sed 's/-noconfirm//g')
# 最初の行に "-NoConfirm" がある場合も引き続き削除
translated_text=$(echo "$translated_text" | sed '1{/^ *\-NoConfirm/d;}')
# 空白行を削除する（オプション）
translated_text=$(echo "$translated_text" | sed '/^$/d')
# 先頭と末尾の空白をトリムする（オプション）
translated_text=$(echo "$translated_text" | sed 's/^[[:space:]]*//;s/[[:space:]]*$//')

# 整形テキスト
display_text="---------- Original ----------\n$clipboard_text\n\n---------- Japanese ----------\n$translated_text"

# 一時ファイルに書き出し（改行や特殊文字を正確に保持）
temp_file=$(mktemp)
echo -e "$display_text" > "$temp_file"

# Kitty起動（app-id指定、永続するためにcat）
kitty --class=translation_kitty --override background_opacity=0.83 bash -c "cat $temp_file; echo -e '\n\nPress Enter to close'; read"
