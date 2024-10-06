#!/bin/bash

# ホスト名を取得
hostname=$(hostname)

# ホスト名が archdesk の場合
if [ "$hostname" == "archdesk" ]; then
    wayvnc port 5900 &
    wayvnc port 5901 &
fi

