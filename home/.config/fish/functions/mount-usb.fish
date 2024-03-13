function mount-usb
	sudo mount -o gid=wheel,fmask=113,dmask=002 $argv[1] $argv[2]
end
