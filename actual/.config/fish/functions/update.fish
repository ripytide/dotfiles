function update
	sudo nix-channel --update
	sudo nix-env -u --always
	sudo nix build --no-link -f '<nixpkgs/nixos>' config.system.build.toplevel
	sudo nixos-rebuild switch
	rustup update
	git -C ~/dotfiles pull
	pass git pull
end
