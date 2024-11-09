# NixOS configuration
{ config, pkgs, lib, inputs, ... }:

{
  imports = [
    ./hardware-configuration.nix
    inputs.home-manager.nixosModules.home-manager
  ];

  # Home-manager
  home-manager = {
    extraSpecialArgs = { inherit inputs; };
    users = {
      kassie = import ./home.nix;
    };
  };

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "laptop"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Enable flakes
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "America/New_York";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_US.UTF-8";
    LC_IDENTIFICATION = "en_US.UTF-8";
    LC_MEASUREMENT = "en_US.UTF-8";
    LC_MONETARY = "en_US.UTF-8";
    LC_NAME = "en_US.UTF-8";
    LC_NUMERIC = "en_US.UTF-8";
    LC_PAPER = "en_US.UTF-8";
    LC_TELEPHONE = "en_US.UTF-8";
    LC_TIME = "en_US.UTF-8";
  };

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.kassie = {
    isNormalUser = true;
    description = "kassie";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [];
  };

#  # Home Manager
#  home-manager = {
#    # also pass inputs to home-manager modules
#    extraSpecialArgs = { inherit inputs; };
#    users = {
#      "kassie" = import ./home.nix;
#    };
#  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # Installing fonts
  fonts.packages = with pkgs; [
    noto-fonts
    noto-fonts-cjk-sans
    noto-fonts-emoji
    font-awesome
    (nerdfonts.override { fonts = [ "JetBrainsMono" ]; })
  ];

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    home-manager
    neovim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
    fastfetch
    glibc
    gcc
    git
    kitty
    starship
    btop
    gdm
    nautilus
    wofi
    mpv
    unzip
    swaynotificationcenter
    firefox
    hyprshot
    hyprpaper
    hyprlock
    hypridle
    spotify
    vesktop
    waybar
    playerctl
    polkit_gnome
    libnotify
    lazygit
    nwg-look
    lshw
    xdg-desktop-portal-hyprland
    xdg-desktop-portal-gtk
    pavucontrol
    prismlauncher
    cargo
    rustc
    rustup
  ];

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable.

  # Fix to allow dynamically linked executables to run
  programs.nix-ld.enable = true;
  programs.nix-ld.libraries = with pkgs; [
    # Add any missing dynamic libraries for unpackaged programs
    # here, NOT in environment.systemPackages
  ];

  # Starship
  programs.starship.enable = true;

  # Enable NVIDIA drivers for Xorg and Wayland
  services.xserver.videoDrivers = ["nvidia"];
  hardware.nvidia = {
    # Modesetting is required
    modesetting.enable = true;
    # NVIDIA power management causes problems
    powerManagement.enable = false;
    powerManagement.finegrained = false;
    # NVIDIA open-source kernel module (not to be confused with Nouveau)
    open = false;
    # NVIDIA settings menu
    nvidiaSettings = true;
    # Optionally, select the appropriate driver version
    # package = config.boot.kernelPackages.nvidiaPackages.stable;
    # Force full composition pipeline - reported to reduce performance of some OpenGL applications and may produce issues in WebGL
    # forceFullCompositionPipeline = true;
  };

  # Enable xserver
  services.xserver.enable = true;

  # Enable lightdm display manager
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.displayManager.gdm.wayland = true;

  # Enable hyprland
  programs.hyprland.enable = true;
  # Optional, hint electron apps to use wayland
  environment.sessionVariables.NIXOS_OZONE_WL = "1";

  # Enable GVfs
  services.gvfs.enable = true;

  # Enable pipewire
  security.rtkit.enable = true;
  services.pipewire ={
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # If you want to use JACK applications, uncomment this:
    # jack.enable = true;
  };

  # Enable the OpenSSH daemon.
  services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "24.05"; # Did you read the comment?

}
