#!/bin/bash

# クリップボードからテキストを取得（Wayland環境を想定）
clipboard_text=$(wl-paste -p)

# 取得したテキストが空でないことを確認
if [ -z "$clipboard_text" ]; then
    notify-send "Translation" "Clipboard is empty."
    exit 1
fi

# 翻訳を実行 (例: 英語から日本語へ)
translated_text=$(trans -brief -noconfirm -no-warn-empty :ja "$clipboard_text" 2>/dev/null)

# translate-shell の終了ステータスを確認
if [ $? -ne 0 ] || [ -z "$translated_text" ]; then
    notify-send "Translation Failed" "Could not translate text. Check network or trans-shell installation."
    exit 1
fi

# --- translate-shellの出力から"-NoConfirm"を削除する処理を追加 ---
# translate-shellの最初の行に"-NoConfirm"が含まれる場合があるため、それを削除
translated_text=$(echo "$translated_text" | sed '1{/^ *\-NoConfirm/d;}')

# 翻訳結果の整形
display_text="--- Original Text (Auto) ---\n$clipboard_text\n\n--- Translated Text (Japanese) ---\n$translated_text"

# デバッグ用出力（最終的には削除してもOK）
echo "DEBUG: Original text: $clipboard_text"
echo "DEBUG: Translated text (cleaned): $translated_text"
echo "DEBUG: Display text prepared: $display_text"

# --- ウィンドウの起動と操作ロジックを強化 ---

# 1. まず、指定のapp_id/classを持つKittyウィンドウのIDを検索
KITTY_WINDOW_ID=$(swaymsg -t get_tree | jq -r '.. | select(type == "object") | select(.app_id? == "translation_kitty" or (.window_properties? and .window_properties.class? == "translation_kitty")) | .id' | head -n 1)

# 2. もしKittyウィンドウが存在しない場合
if [ -z "$KITTY_WINDOW_ID" ]; then
    echo "DEBUG: No existing Kitty window found. Launching new one."
    # 新しいKittyウィンドウをバックグラウンドで起動
    # 初期メッセージなしで `cat` を実行し、リモートコントロールで内容を更新可能にする
    kitty --class "translation_kitty" -T "Translation Window" bash -c "cat" &
    echo "DEBUG: Kitty launched with class 'translation_kitty'."

    # 新しいウィンドウがSwayに完全に認識されるまで、ループで待機
    MAX_RETRIES=10 # 最大10回リトライ (合計 10 * 0.2 = 2秒間待機)
    RETRY_COUNT=0
    WAIT_INTERVAL=0.2 # 0.2秒ごとにチェック

    echo "DEBUG: Waiting for Kitty window to be identified by Sway..."
    while [ -z "$KITTY_WINDOW_ID" ] && [ "$RETRY_COUNT" -lt "$MAX_RETRIES" ]; do
        sleep "$WAIT_INTERVAL"
        KITTY_WINDOW_ID=$(swaymsg -t get_tree | jq -r '.. | select(type == "object") | select(.app_id? == "translation_kitty" or (.window_properties? and .window_properties.class? == "translation_kitty")) | .id' | head -n 1)
        RETRY_COUNT=$((RETRY_COUNT+1))
        echo "DEBUG: Retry $RETRY_COUNT: Kitty window ID: $KITTY_WINDOW_ID"
    done

    # IDが取得できたか最終確認
    if [ -z "$KITTY_WINDOW_ID" ]; then
        notify-send "Error" "Failed to launch or identify translation_kitty window after multiple retries. Check Kitty/Sway config."
        exit 1
    fi

    # 新しく起動したウィンドウをスクラッチパッドに移動（初回だけ）
    echo "DEBUG: Translation Kitty window moved to scratchpad."
    swaymsg '[app_id="translation_kitty"] move to scratchpad'
fi

# 3. 翻訳結果を既存の（または今起動した）Kittyウィンドウに送信
# 画面をクリア (VT100エスケープシーケンス) を最初に送る
printf "\x1b[2J\x1b[H" | kitty @ send-text --match app_id:"translation_kitty"
# その後、翻訳結果のテキストを送信
printf "%b" "$display_text\n" | kitty @ send-text --match app_id:"translation_kitty"
echo "DEBUG: Translation text sent to Kitty window."

# 4. スクラッチパッドウィンドウを表示/非表示をトグル
swaymsg '[app_id="translation_kitty"] scratchpad show'
echo "DEBUG: Scratchpad toggled."
