function prev
	if is_monocle
		toggle_monocle
		bspc node -f prev.local.window.!hidden
		toggle_monocle
	else
		bspc node -f prev.local.window.!hidden
	end
end
