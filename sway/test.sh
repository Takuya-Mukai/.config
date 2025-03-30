#!/bin/bash

# アプリケーションとワークスペースの対応
declare -A apps=(
  ["pomodorolm"]="7"
  ["saber"]="1"
  ["input-remapper-gtk"]="5"
  ["com.github.iwalton3.jellyfin-media-player"]="8"
  ["obsidian"]="7"
)

# 各アプリケーションに対して処理を行う
for app in "${!apps[@]}"; do
  workspace="${apps[$app]}"

  # swayウィンドウツリー構造を取得
  tree=$(swaymsg -t get_tree)

  # アプリケーションがswayによって管理されているか確認
  if echo "$tree" | jq -r ".nodes[] | .nodes[] | .nodes[] | select(.app_id == \"$app\")" > /dev/null; then
    # 起動している場合は、指定されたワークスペースに移動
    swaymsg "[app_id=\"$app\"] move container to workspace number $workspace"
  else
    # 起動していない場合は、アプリケーションを起動し、指定されたワークスペースに移動
    swaymsg "exec $app; [app_id=\"$app\"] move container to workspace number $workspace"
  fi
done
