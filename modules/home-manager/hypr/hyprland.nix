# Hyprland config
{ inputs, pkgs, ... }: {
  home.packages = with pkgs; [
    hyprcursor
    hyprpicker
    hyprshot
    wl-clip-persist
    cliphist
    glib
    wayland
    direnv
  ];
  wayland.windowManager.hyprland = {
    enable = true;
    package = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland;
  };
}
