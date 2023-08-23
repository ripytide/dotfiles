function update
	sudo nix-channel --update
	sudo nix-env -u --always
	sudo nix build --no-link -f '<nixpkgs/nixos>' config.system.build.toplevel -I nixos-config=&HOME/.config/nixos/configuration.nix
	sudo nixos-rebuild switch -I nixos-config=&HOME/.config/nixos/configuration.nix
	rustup update
	git -C ~/dotfiles pull
	pass git pull
end
