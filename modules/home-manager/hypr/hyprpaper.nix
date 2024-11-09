# Hyprpaper config
{ config, pkgs, ... }: {
  home.packages = [ pkgs.hyprpaper ];

  services.hyprpaper.enable = true;
  home.file = {
    ".config/hypr/hyprpaper.conf".source = ./hyprconf/hyprpaper.conf;
  };
}
