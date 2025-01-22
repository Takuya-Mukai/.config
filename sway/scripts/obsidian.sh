#!/bin/bash

echo "スクリプト開始"

# Obsidianが実行中か確認
if pgrep -x obsidian > /dev/null; then
    echo "Obsidianが実行中です"

    # Obsidianウィンドウの状態を取得
    window_info=$(swaymsg -t get_tree | jq '.. | select(.window_properties?.class?== "obsidian")')

    # visibleがtrueかfalseかを確認
    visible=$(echo "$window_info" | jq '.visible')

    if [ "$visible" == "true" ]; then
        echo "Obsidianは表示されています。フルスクリーンを無効にします。"
        swaymsg [class="obsidian"] fullscreen disable
        swaymsg [class="obsidian"] scratchpad show
    else
        echo "Obsidianは表示されていません。フルスクリーンを有効にします。"
        swaymsg [class="obsidian"] fullscreen enable
        swaymsg [class="obsidian"] scratchpad show
    fi
else
    echo "Obsidianは実行されていません。起動します。"
    ~/.appimage/Obsidian.AppImage
fi

echo "スクリプト終了"
