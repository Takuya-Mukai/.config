#!/bin/bash

# ホスト名を取得
hostname=$(cat /etc/hostname)

# ホスト名が archdesk の場合
if [ "$hostname" = "archdesk" ]; then
  wayvnc -S /tmp/wayvnc_default1.sock -o=DP-1 127.0.0.1 5900 &
  wayvnc -S /tmp/wayvnc_default2.sock -o=HDMI-A-1 127.0.0.1 5901 &
fi
