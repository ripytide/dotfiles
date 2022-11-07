function toggle_monocle
	if is_monocle
		for node in (bspc query -N -n '.!focused.window' -d focused)
			bspc node $node -g hidden=off
		end
		set -e (bspc query -D -d focused)
	else
		for node in (bspc query -N -n '.!focused.window' -d focused)
			bspc node $node -g hidden=on
		end
		set -U (bspc query -D -d focused)
	end
end
