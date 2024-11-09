# System
{ self, pkgs, lib, inputs, ... }: {
  nix = {
    settings = {
      auto-optimise-store = true;
      experimental-features = [ "nix-command" "flakes" ];
    };
  };
  nixpkgs = {
    config.allowUnfree = true;
    overlays = [
      inputs.nur.overlay
    ];
    config.permittedInsecurePackages = [
      "olm-3.2.16"  # Needed for nheko
    ];
  };

  environment.systemPackages = with pkgs; [
    wget
    git
  ];

  time.timeZone = "America/New_York";
  i18n.defaultLocale = "en_US.UTF-8";
  system.stateVersion = "24.05"; # DON'T CHANGE: "24.05"

  # Enables automatic system upgrades
  system.autoUpgrade = {
    enable = true;
    allowReboot = true;
  };
}
