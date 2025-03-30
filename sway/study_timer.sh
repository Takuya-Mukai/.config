#!/bin/bash

# 引数として渡された秒数を受け取る
study_seconds="$1"

# 指定時間待機
sleep "$study_seconds"

# デフォルトモードに戻す
swaymsg mode "default"
notify-send "It's time to relax!"
