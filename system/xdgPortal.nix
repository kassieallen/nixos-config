# XDG configuration
{ pkgs, ... }: {
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
}
