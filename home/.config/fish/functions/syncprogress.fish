function syncprogress
	sync & watch -n 1 grep -e Dirty: /proc/meminfo
end
