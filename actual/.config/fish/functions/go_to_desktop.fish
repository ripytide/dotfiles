function go_to_desktop
	if set -qU DESKTOP_NUM
		bspc desktop -f ^(math $argv[1] "+" $DESKTOP_NUM)
	else
		set -U DESKTOP_NUM 0
		bspc desktop -f ^$1
	end
end
