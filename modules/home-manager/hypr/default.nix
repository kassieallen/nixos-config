# Hypr ecosystem default
{ inputs, ... }: {
  imports = [
    ./config.nix
    ./envVars.nix
    # ./hypridle
    ./hyprland.nix
    inputs.hyprland.homeManagerModules.default
    ./hyprlock.nix
    # ./hyprpaper.nix
  ];
}
