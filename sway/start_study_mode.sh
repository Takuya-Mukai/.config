#!/bin/bash

# 勉強時間を入力させる (時間単位)
read -p "Enter the study time here: " study_time

# バックグラウンドでタイマースクリプトを実行し、秒数を渡す
"$HOME/.config/sway/study_timer.sh" "$study_time" &

# Study Mode に切り替え
swaymsg mode "study"

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

notify-send "Study Mode will start.\
  While ${study_time}, key bindings are disabled."

# このスクリプトはここで終了し、kittyが閉じる
exit 0
