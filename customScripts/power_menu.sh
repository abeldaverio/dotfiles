#!/bin/sh

menu=$(printf "󰐥\tPower off\n󰑓\tReboot\n\tLock\n󰍃\tLog out" | rofi -dmenu -i -selected-row 1 -p " ⏼   ")

case "$menu" in
*"Power off") shutdown now ;;
*"Reboot") reboot ;;
*"Lock") pidof hyprlock || hyprlock ;;
*"Log out") hyprctl dispatch exit ;;
"pipi") kitty -e yes pipi ;;
*) exit ;;
esac
