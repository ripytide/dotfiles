#!/bin/sh

xrandr --output eDP1 --off --output HDMI2 --primary --mode 1920x1080 --rotate left

bspc monitor --rectangle 1080x1920+0+0

# necceccary as you always need at least one desktop on every monitor
# for some reason
bspc monitor HDMI2 -a FakeHDMI2
bspc monitor eDP1 -a FakeDP1

bspc desktop one -m HDMI2
bspc desktop two -m HDMI2
bspc desktop three -m HDMI2
bspc desktop four -m HDMI2
bspc desktop five -m HDMI2
bspc desktop six -m HDMI2
