#!/bin/bash

entries="⇠ Logout\n⏾ Suspend\n⭮ Reboot\n⏻ Shutdown"

selected=$(echo -e $entries|wofi --width 270 --height 260 --dmenu --cache-file /dev/null | awk '{print tolower($2)}')

case $selected in
  logout)
    pkill -u kia;;
  suspend)
    exec systemctl suspend;;
  reboot)
    exec systemctl reboot;;
  shutdown)
    exec systemctl poweroff;;
    # it used to be poweroff -i
esac
