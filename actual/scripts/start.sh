#! /bin/sh

sudo bash -c 'evremap remap "/home/ripytide/.config/evremap/evremap.toml" &'

playerctld daemon &

waybar &
sleep 1
killall -SIGUSR1 waybar

dunst &

#udiskie &

Hyprland
