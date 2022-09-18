function toggle_polybar
	if set -qU polybar
		polybar-msg cmd hide
!spacing_off
		set -e polybar
	else
		polybar-msg cmd show
!spacing_on
		set -U polybar
	end
end
