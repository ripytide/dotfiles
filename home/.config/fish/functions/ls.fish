function ls
	command eza --long --group --icons --group-directories-first --git -s modified $argv
end
