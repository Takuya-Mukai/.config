#!/bin/bash

# 勉強時間を入力させる (時間単位)
read -p "Enter the study time here: " study_time

# Study Mode に切り替え
swaymsg mode "study"

# アプリケーションとワークスペースの対応
declare -A apps=(
    ["pomodorolm"]="7"
    ["saber"]="1"
    ["org.kde.polkit-kde-authentication-agent-1"]="5"
    ["com.github.iwalton3.jellyfin-media-player"]="8"
    ["obsidian"]="7"
)

# アプリケーションの起動コマンド名の対応
declare -A app_exec=(
    ["pomodorolm"]="pomodorolm"
    ["saber"]="saber"
    ["org.kde.polkit-kde-authentication-agent-1"]="input-remapper-gtk"
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
    if [[ "$app" == "obsidian" ]]; then
      swaymsg "[app_id=\"$app\"] move container to workspace number $workspace"
      swaymsg "[app_id=\"$app\"] floating disable"
    else
      swaymsg "[app_id=\"$app\"] move container to workspace number $workspace"
    fi
    echo "Info: $app is already running and moved to workspace $workspace."

  else
    # アプリが起動していない場合
    echo "Warning: $app is not running. Starting $exec_name..."
    swaymsg "exec $exec_name"
    sleep 1

    # 起動後にワークスペースに移動
    if [[ "$app" == "obsidian" ]]; then
      swaymsg "[app_id=\"$app\"] move container to workspace number $workspace"
      swaymsg "[app_id=\"$app\"] floating disable"
    else
      swaymsg "[app_id=\"$app\"] move container to workspace number $workspace"
    fi
    echo "Info: $app started and moved to workspace $workspace."
  fi
done

swaymsg "[app_id=\"floating-study-terminal\"] move scratchpad "

notify-send "Study Mode will start.\
  While ${study_time}, key bindings are disabled."
# 指定時間待機
sleep "$study_time"

# デフォルトモードに戻す
swaymsg mode "default"
notify-send "It's time to relax!"

exit 0
