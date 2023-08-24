# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running `nixos-help`).

{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It's perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "22.05"; # Did you read the comment?
  
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  nixpkgs.config.allowUnfree = true;

  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Set your time zone.
  time.timeZone = "Europe/London";

  # List services that you want to enable:

  services.openssh.enable = false;

  systemd.services.ydotoold = {
    enable = true;
    description = "An auto-input utility for wayland";
    unitConfig = {
      Type = "simple";
    };
    serviceConfig = {
      ExecStart = "${pkgs.ydotool}/bin/ydotoold";
    };
    wantedBy = [ "multi-user.target" ];
  };

  networking.hostName = "devourer"; # Define your hostname.
  # Pick only one of the below networking options.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.
  networking.networkmanager.enable = true;  # Easiest to use and most distros use this by default.

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  networking.firewall.enable = false;

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  # Enable sound.
  sound.enable = true;
  hardware.pulseaudio.enable = true;

  services.printing.enable = true;
  services.avahi.enable = true;
  services.avahi.nssmdns = true;
  # for a WiFi printer
  services.avahi.openFirewall = true;

  users.users.ripytide = {
    isNormalUser = true;
    extraGroups = [ "wheel" "networkmanager" ];
    packages = with pkgs; [];
  };

  security.sudo = {
    enable = true;
    extraRules = [{
      commands = [
        {
          command = "/run/current-system/sw/bin/ydotool";
          options = [ "NOPASSWD" ];
        }
      ];
      groups = [ "wheel" ];
    }];
  };

  hardware.opengl = {
    enable = true;
    driSupport = true;
    driSupport32Bit = true;
  };

  services.xserver.videoDrivers = [ "nvidia" ];
  hardware.nvidia = {
    modesetting.enable = true;
    open = false;
    nvidiaSettings = true;
    package = config.boot.kernelPackages.nvidiaPackages.stable;
  };

  programs.hyprland = {
    enable = true;
    enableNvidiaPatches = true;
  };

  fonts.packages = with pkgs; [
	nerdfonts
	noto-fonts
	noto-fonts-emoji
    fira-code
    fira-code-nerdfont
	fira-code-symbols
  ];

  environment.systemPackages = with pkgs; [
  	# Desktop Stuff
	fish
    dunst
	waybar
	ydotool
	starship
	playerctl
	pavucontrol
	rofi-wayland
	pokemon-colorscripts-mac

	# Core and Language Stuff
	gcc
	git
	rustup
	busybox
	python312

	# CLI Stuff
	exa
	fzf
	bat
	sxiv
	delta
	bottom
	neovim
	zoxide
	lazygit
	ripgrep
	tealdeer
	rm-improved
	pass-wayland

	# GUI Stuff
	kitty
	firefox
	libreoffice-fresh
	kicad
	freecad

	# Custom Stuff
	(import ./packages/evremap.nix {inherit pkgs;})
  ];

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
	pinentryFlavor = "gnome3";
  };
}

