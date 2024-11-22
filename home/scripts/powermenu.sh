#!/usr/bin/env bash

lock="  lock"
logout="󰗽  logout"
sleep="  sleep"
reboot="  reboot"
shutdown="  shutdown"

options="
$lock
$logout
$sleep
$shutdown
"

selection=$(echo "$options" | tofi)

if [ "$selection" == "$lock" ]; then
  swaylock -f
  exit 1
elif [ "$selection" == "$logout" ]; then
  loginctl terminate-user "$(whoami)"
  exit 1
elif [ "$selection" == "$sleep" ]; then
  systemctl suspend;
  exit 1
elif [ "$selection" == "$reboot" ]; then
  systemctl restart;
  exit 1
elif [ "$selection" == "$shutdown" ]; then
  shutdown now
  exit 1
fi
