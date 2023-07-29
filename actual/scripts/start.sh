#! /bin/sh
#output date so the logs can understood better
echo -e "\n"
date
echo -e "\n"

#enable playerctl daemon for media controls to work with the last active media source
playerctld daemon &

wayland &

dunst &

sudo ydotoold &

#udiskie &

#aw-server-rust &
#aw-watcher-afk &
#aw-watcher-window &
