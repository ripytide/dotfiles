function update
	sudo nix-channel --update -v
	sudo nix-env -u --always -v
	sudo nix build --no-link -f '<nixpkgs/nixos>' config.system.build.toplevel -I nixos-config=&HOME/.config/nixos/configuration.nix -v
	sudo nixos-rebuild switch -I nixos-config=&HOME/.config/nixos/configuration.nix -v
	rustup update
	pass git pull
end
