#! /bin/sh
#output date so the logs can understood better
echo -e "\n"
date
echo -e "\n"

#restart sxhkd
pgrep -x sxhkd > /dev/null || sxhkd &

#turn off mouse acceleration
xinput --set-prop 12 303 0 1 &

#choose random wallpapers
~/scripts/changewallpaper.sh 0 &

#enable playerctl daemon for media controls to work with the last active media source
playerctld daemon &

#enable picom compositer for tranparency and blur
#picom -b &

#run polybar
#~/.config/polybar/launch.sh &

#run notification server: dunst
dunst &

!keymapper

#xautolock -time 15 -locker "systemctl suspend" -detectsleep &

xscreensaver &

xss-lock -- xscreensaver-command -lock &

udiskie &

aw-qt &

wal -R

#start bspwm
bspwm
