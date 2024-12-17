# Home-manager GTK configuration
{ lib, config, pkgs, ... }:
let
  inherit (lib) mkIf mkEnableOption;
  cfg = config.modules.gtk;
in {
  options.modules.gtk = {
    enable = mkEnableOption "GTK Configuration";
  };

  config = mkIf cfg.enable {
    fonts.fontconfig.enable = true;
    gtk = {
      enable = true;
      theme = {
        package = pkgs.gnome-themes-extra;
        name = "Adwaita-dark";
      };
      cursorTheme = { name = "Posy_Cursor_Black"; };
    };

    home.pointerCursor = {
      package = pkgs.posy-cursors;
      name = "Posy_Cursor_Black";
      size = 32;
      gtk.enable = true;
    };
  };
}
