#! /bin/sh
#output date so the logs can understood better
echo -e "\n"
date
echo -e "\n"

#restart sxhkd
pgrep -x sxhkd >/dev/null || sxhkd &

#turn off mouse acceleration
xinput --set-prop 12 303 0 1 &

#choose random wallpapers
~/scripts/changewallpaper.sh 0 &

#enable playerctl daemon for media controls to work with the last active media source
playerctld daemon &

#enable picom compositer for tranparency and blur
picom -b

#run polybar
~/scripts/launch_polybar.sh &

#run notification server: dunst
dunst &

input-remapper-control --command autoload &

xscreensaver &

xss-lock -- xscreensaver-command -lock &

xautolock -time 15 -locker "xscreensaver-command -lock" -detectsleep \
	-notify 10 -notifier 'notify-send "Locking Screen in 10 seconds"'\
	-corners 00-0 -killtime 10 -killer "systemctl hybrid-sleep" &

udiskie &

aw-server-rust &
aw-watcher-afk &
aw-watcher-window &

#wal -R

watcher.sh &

xcape -e 'Super_L=Escape' &

#start bspwm
bspwm
