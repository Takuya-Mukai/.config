#!/bin/bash

# クリップボードからテキストまたは画像データを取得（Wayland環境）
# wl-pasteの出力は、クリップボードの内容によって異なるため、
# 画像データの場合は一時ファイルに保存して処理します。

# クリップボードの内容を一時ファイルに保存
temp_clipboard_content=$(mktemp)
wl-paste > "$temp_clipboard_content"

# クリップボードが空かどうかを確認
if [ ! -s "$temp_clipboard_content" ]; then
    notify-send "Translation" "Clipboard is empty."
    rm "$temp_clipboard_content"
    exit 1
fi

# クリップボードの内容が画像かどうかを判定
# fileコマンドを使ってMIMEタイプをチェック
mime_type=$(file --mime-type -b "$temp_clipboard_content")

clipboard_text=""

if [[ "$mime_type" == image/* ]]; then
    # 画像の場合、Tesseract OCRでテキストを抽出
    # 一時画像ファイルをPNGに変換（Tesseractが対応しやすい形式）
    temp_image_png=$(mktemp --suffix=.png)
    convert "$temp_clipboard_content" "$temp_image_png" 2>/dev/null

    if [ $? -ne 0 ]; then
        notify-send "OCR Failed" "Could not convert image for OCR."
        rm "$temp_clipboard_content" "$temp_image_png"
        exit 1
    fi

    # TesseractでOCRを実行
    # -l jpne: 日本語と英語の認識を試みる
    # --psm 3: デフォルトのページセグメンテーションモード（自動ページセグメンテーション）
    # stdoutに出力するために、出力ファイル名を指定せず - で標準出力
    ocr_result=$(tesseract "$temp_image_png" -l jpne --psm 3 stdout 2>/dev/null)

    if [ $? -ne 0 ] || [ -z "$ocr_result" ]; then
        notify-send "OCR Failed" "Could not extract text from image."
        rm "$temp_clipboard_content" "$temp_image_png"
        exit 1
    fi
    clipboard_text="$ocr_result"
    rm "$temp_image_png" # 一時画像ファイルを削除
else
    # テキストの場合、そのまま使用
    clipboard_text=$(cat "$temp_clipboard_content")
fi

rm "$temp_clipboard_content" # クリップボードの一時ファイルを削除

# 空チェック（OCR後も含む）
if [ -z "$clipboard_text" ]; then
    notify-send "Translation" "No text found in clipboard or extracted from image."
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
translated_text=$(echo "$translated_text" | sed 's/-noconfirm//g')
translated_text=$(echo "$translated_text" | sed '1{/^ *\-NoConfirm/d;}')
translated_text=$(echo "$translated_text" | sed '/^$/d')
translated_text=$(echo "$translated_text" | sed 's/^[[:space:]]*//;s/[[:space:]]*$//')

# 整形テキスト
display_text="---------- Original ----------\n$clipboard_text\n\n---------- Japanese ----------\n$translated_text"

# 一時ファイルに書き出し（改行や特殊文字を正確に保持）
temp_file=$(mktemp)
echo -e "$display_text" > "$temp_file"

# Kitty起動（app-id指定、永続するためにcat）
kitty --class=translation_kitty --override background_opacity=0.83 bash -c "cat $temp_file; echo -e '\n\nPress Enter to close'; read"

# 一時ファイルを削除
rm "$temp_file"
