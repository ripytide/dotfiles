function toggle_polybar
	if set -qU polybar
		polybar-msg cmd hide
		bspc config -m $MONITOR top_padding 0
		set -e polybar
	else
		polybar-msg cmd show
		bspc config -m $MONITOR top_padding 20
		set -U polybar
	end
end
