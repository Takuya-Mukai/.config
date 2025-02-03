#!/bin/bash

echo "スクリプト開始"

# Obsidianが実行中か確認
if pgrep -f "electron.*obsidian" > /dev/null; then
    echo "Obsidianが実行中です"

    # Obsidianウィンドウの状態を取得
    window_info=$(swaymsg -t get_tree | jq '.. | select(.window_properties?.app_id? == "obsidian")')

    # visibleがtrueかfalseかを確認
    visible=$(echo "$window_info" | jq '.visible')

    if [ "$visible" == "true" ]; then
        echo "Obsidianは表示されています。フルスクリーンを無効にします。"
        swaymsg [app_id="obsidian"] fullscreen disable
        swaymsg [app_id="obsidian"] scratchpad show
    else
        echo "Obsidianは表示されていません。フルスクリーンを有効にします。"
        swaymsg [app_id="obsidian"] fullscreen enable
        swaymsg [app_id="obsidian"] scratchpad show
    fi
else
    echo "Obsidianは実行されていません。起動します。"
    obsidian
fi

echo "スクリプト終了"
