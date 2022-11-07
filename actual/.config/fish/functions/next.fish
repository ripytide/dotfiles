function next
	if is_monocle
		toggle_monocle
		bspc node -f next.local.window.!hidden
		toggle_monocle
	else
		bspc node -f next.local.window.!hidden
	end
end
