function man
	if command man $argv[1] > /dev/null 2>&1
		command man $argv[1] | nvim
	else
		echo "No Man Page Found"
	end
end
