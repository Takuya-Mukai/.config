#!/bin/bash

echo "スクリプト開始"

# Obsidianが実行中か確認
if pgrep -f "electron.*obsidian" > /dev/null; then
    # Obsidianウィンドウの状態を取得
    window_info=$(swaymsg -t get_tree | jq '.. | select(.window_properties?.app_id? == "obsidian")')

    # visibleがtrueかfalseかを確認
    visible=$(echo "$window_info" | jq '.visible')

    if [ "$visible" == "true" ]; then
        swaymsg [app_id="obsidian"] fullscreen disable
        swaymsg [app_id="obsidian"] scratchpad show
    else
        swaymsg [app_id="obsidian"] fullscreen enable
        swaymsg [app_id="obsidian"] scratchpad show
    fi
else
    obsidian
fi

echo "スクリプト終了"
