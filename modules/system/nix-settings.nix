# Nix configuration
{ pkgs, ... }: {
  documentation.doc.enable = false;
  nixpkgs.config.allowUnfree = true;
  nix = {
    settings = {
      auto-optimise-store = true;
      experimental-features = [ "nix-command" "flakes" ];
      warn-dirty = false;
    };

    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 7d";
    };
  };

  # Enables automatic system upgrades
  system.autoUpgrade = {
    enable = true;
    allowReboot = true;
  };

  # Run unpatched dynamic binaries on NixOS
  programs.nix-ld = {
    enable = true;
    libraries = with pkgs; [  ];
  };
  services.dbus.enable = true;
  system.stateVersion = "24.05"; # Probably shouldn't touch this...
}
