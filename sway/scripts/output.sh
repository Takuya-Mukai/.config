#!/bin/bash

HOSTNAME=$(cat /etc/hostname)

if [ "$HOSTNAME" = "archdesk" ]; then
  swaymsg output DP-1 resolution 1920x1080 position 0 0 transform 270
  swaymsg output HDMI-A-1 resolution 1920x1080 position 1080 420 
  swaymsg output DP-2 resolution 1920x1080 position 1080 1500
  swaymsg workspace 1 output DP-1
  swaymsg workspace 2 output DP-1
  swaymsg workspace 3 output DP-1
  swaymsg workspace 4 output DP-1
  swaymsg workspace 5 output DP-2
  swaymsg workspace 6 output HDMI-A-1
  swaymsg workspace 7 output HDMI-A-1
  swaymsg workspace 8 output HDMI-A-1
  swaymsg workspace 9 output HDMI-A-1
  swaymsg workspace 10 output DP-2
elif [ "$HOSTNAME" = "archmini" ]; then
  swaymsg workspace 1 output DP-2
  swaymsg workspace 2 output DP-2
  swaymsg workspace 3 output DP-2
  swaymsg workspace 4 output DP-2
  swaymsg workspace 5 output DP-2
  swaymsg workspace 6 output HDMI-A-2
  swaymsg workspace 7 output HDMI-A-2
  swaymsg workspace 8 output HDMI-A-2
  swaymsg workspace 9 output HDMI-A-2
  swaymsg workspace 10 output HDMI-A-2
fi
