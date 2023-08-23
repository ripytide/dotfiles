#! /bin/sh

playerctld daemon &

waybar &
sleep 1
killall -SIGUSR1 waybar

dunst &

sudo bash -c 'ydotoold &'

sudo bash -c 'evremap remap "/home/ripytide/.config/evremap/evremap.toml" &'

#udiskie &
Hyprland
