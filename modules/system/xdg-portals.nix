# XDG configuration
{ lib, config, pkgs, ... }:
let
  inherit (lib) mkIf mkEnableOption;
  cfg = config.modules.xdg-portals;
in {
  options.modules.xdg-portals = {
    enable = mkEnableOption "XDG Portals";
  };

  config = mkIf cfg.enable {
    xdg.portal = {
      enable = true;
      wlr.enable = true;
      xdgOpenUsePortal = true;
      extraPortals = with pkgs; [
        xdg-desktop-portal-gtk
        xdg-desktop-portal-wlr
      ];
      config.common.default = "*";
    };
    environment.systemPackages = with pkgs; [ xdg-utils ];
  };
}
