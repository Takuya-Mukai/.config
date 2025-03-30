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

# アプリケーションの起動コマンド名の対応
declare -A app_exec=(
    ["pomodorolm"]="pomodorolm"
    ["saber"]="saber"
    ["input-remapper-gtk"]="input-remapper-gtk"
    ["com.github.iwalton3.jellyfin-media-player"]="jellyfinmediaplayer"
    ["obsidian"]="obsidian"
)

# 各アプリケーションに対して処理を行う
for app in "${!apps[@]}"; do
  workspace="${apps[$app]}"
  exec_name="${app_exec[$app]}" # 起動コマンド名を取得

  # jq の実行結果を変数に格納し、エラーメッセージを除外する
  if swaymsg -t get_tree | jq -e 'recurse(.nodes[]?, .floating_nodes[]?) | select(.app_id == "'"$app"'" or .scratchpad_state == "hidden")' > /dev/null; then
    # アプリが既に起動している場合
    swaymsg "[app_id=\"$app\"] move container to workspace number $workspace"
    echo "Info: $app is already running and moved to workspace $workspace."
  else
    # アプリが起動していない場合
    echo "Warning: $app is not running. Starting $exec_name..."
    swaymsg "exec $exec_name"

    # アプリケーションが起動するまで待機 (最大10秒)
    sleep 1
    # 起動後にワークスペースに移動
    swaymsg "[app_id=\"$app\"] move container to workspace number $workspace"
    echo "Info: $app started and moved to workspace $workspace."
  fi
done

notify-send "Study Mode will start.\
  While ${study_time}, key bindings are disabled."

# このスクリプトはここで終了し、kittyが閉じる
exit 0
