{ config, pkgs, ... }:

{
  imports =
    [
      # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];


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

  # Custom Services
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
  systemd.services.evremap = {
    enable = true;
    unitConfig = {
      Type = "simple";
    };
    serviceConfig = {
      ExecStart = ''${(import ./packages/evremap.nix { inherit pkgs; })}/bin/evremap remap "&HOME/.config/evremap/evremap.toml"'';
    };
    wantedBy = [ "multi-user.target" ];
  };

  networking.hostName = "devourer"; # Define your hostname.
  # Pick only one of the below networking options.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.
  networking.networkmanager.enable = true; # Easiest to use and most distros use this by default.

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
    packages = with pkgs; [ ];
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

  nixpkgs.config.packageOverrides = pkgs: {
    vaapiIntel = pkgs.vaapiIntel.override { enableHybridCodec = true; };
  };
  hardware.opengl = {
    enable = true;
    driSupport = true;
    driSupport32Bit = true;
    extraPackages = with pkgs; [
      intel-media-driver
      vaapiIntel
      vaapiVdpau
      libvdpau-va-gl
    ];
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

  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
    pinentryFlavor = "gnome3";
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
	libnotify
    playerctl
    pavucontrol
    wl-clipboard
    rofi-wayland
    pokemon-colorscripts-mac

    # Core and Language Stuff
    gcc
    git
	cmake
    rustup
	gnumake
    busybox
    python312

    # CLI Stuff
    eza
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
    (import ./packages/evremap.nix { inherit pkgs; })
  ];
}
