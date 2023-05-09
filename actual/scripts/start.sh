#! /bin/sh
#output date so the logs can understood better
echo -e "\n"
date
echo -e "\n"

#make the touchpad scrolling in a natural direction
xinput set-button-map "SynPS/2 Synaptics TouchPad" 1 2 3 5 4 6 7

#enable playerctl daemon for media controls to work with the last active media source
playerctld daemon &

#run polybar
~/scripts/launch_polybar.sh &

#run notification server: dunst
dunst &

#udiskie &

aw-server-rust &
aw-watcher-afk &
aw-watcher-window &
