function edit

	set inputs
	set inputs $inputs "fish functions % &HOME/dotfiles/actual/.config/fish/functions"
	set inputs $inputs "neovim         % &HOME/dotfiles/actual/.config/nvim/init.lua"
	set inputs $inputs "nixos          % &HOME/dotfiles/actual/.config/nixos/configuration.nix"
	set inputs $inputs "hyprland       % &HOME/dotfiles/actual/.config/hypr/hyprland.config"
	set inputs $inputs ".config        % &HOME/dotfiles/actual/.config"
	set inputs $inputs "start          % &HOME/dotfiles/actual/scripts/start.sh"

	for input in $inputs
		set split (string split % "$input")
		set name (string trim $split[1])
		set file (string trim $split[2])


	end

end
