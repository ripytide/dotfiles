#! /bin/bash
IDS="$(bspc wm -d | jshon -e focusHistory -a -e nodeId | tac | awk '!seen[$0]++' | sed '/^0*$/d' | tac | tail -$1 | head -1)"
bspc node -f $IDS
