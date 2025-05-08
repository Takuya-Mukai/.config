#!/bin/bash

# ホスト名を取得
hostname=$(cat /etc/hostname)

# ホスト名が archdesk の場合
if [ "$hostname" = "archdesk" ]; then
  wayvnc -S /tmp/wayvnc_default1.sock -o=HDMI-A-1 0.0.0.0 5900 &
  wayvnc -S /tmp/wayvnc_default2.sock -o=DP-2 0.0.0.0 5901 &
  wayvnc -S /tmp/wayvnc_default3.sock -o=DP-1 0.0.0.0 5902 &
  wayvnc -S /tmp/wayvnc_default4.sock -o=HEADLESS-1 0.0.0.0 5903 &
fi
