function close
	if is_monocle
		toggle_monocle
		bspc node -c
		sleep 0.01
		toggle_monocle
	else
		bspc node -c
	end
end
