#!/bin/bash

# ホスト名を取得
hostname=$(cat /etc/hostname)

# ホスト名が archdesk の場合
if [ "$hostname" = "archdesk" ]; then
  swaymsg "workspace 10; exec gtk-launch LINE--LINE--1748362244.746681"
  swaymsg "workspace 10; exec jellyfinmediaplayer"
  swaymsg "workspace 1; exec gtk-launch chrome-bbdeiblfgdokhlblpgeaokenkfknecgl-Default"
  swaymsg "workspace 5; exec kitty"
  swaymsg "workspace 7; exec zen-browser"
fi
if [ "$hostname" = "archmini" ]; then
  swaymsg "workspace 1; exec kitty"
fi
