#! /usr/bin/bash
hostname=$(cat /etc/hostname)

if [ "$hostname" = "archmini" ]; then
caps2sc -m 0 &
fi
