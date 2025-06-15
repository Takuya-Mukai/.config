#!/bin/bash

# ホスト名を取得
hostname=$(cat /etc/hostname)

# ホスト名が archdesk の場合
if [ "$hostname" = "archdesk" ]; then
  swaymsg "workspace 10; exec jellyfinmediaplayer"
  swaymsg "workspace 10; exec gtk-launch chrome-bbdeiblfgdokhlblpgeaokenkfknecgl-Default"
  swaymsg "workspace 4; exec zen-browser"
  swaymsg "workspace 1; exec foot"
  swaymsg "workspace 10; exec gtk-launch LINE--LINE--1748362244.746681"
fi
if [ "$hostname" = "archmini" ]; then
  swaymsg "workspace 1; exec foot"
fi
