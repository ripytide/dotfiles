#! /bin/sh
#output date so the logs can understood better
echo -e "\n"
date
echo -e "\n"

#restart sxhkd
pgrep -x sxhkd >/dev/null || sxhkd &

#make the touchpad scrolling in a natural direction
xinput set-button-map "SynPS/2 Synaptics TouchPad" 1 2 3 5 4 6 7

#choose random wallpapers
~/scripts/changewallpaper.sh 0 &

#enable playerctl daemon for media controls to work with the last active media source
playerctld daemon &

#enable picom compositer for tranparency and blur
#picom -b

#run polybar
~/scripts/launch_polybar.sh &

#run notification server: dunst
dunst &

input-remapper-control --command autoload &

xscreensaver &

xss-lock -- xscreensaver-command -lock &

xautolock -time 15 -locker "xscreensaver-command -lock" -detectsleep \
	-notify 10 -notifier 'notify-send "Locking Screen in 10 seconds"' \
	-corners 00-0 -killtime 10 -killer "systemctl hybrid-sleep" &

#udiskie &

aw-server-rust &
aw-watcher-afk &
aw-watcher-window &

#wal -R

watcher.sh &

xcape -e 'Super_L=Escape' &

xmousepasteblock &

#start bspwm
bspwm
