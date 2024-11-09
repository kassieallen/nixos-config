# Xorg & Xserver
{ pkgs, username, ... }: {
  services = {
    xserver = {
      enable = true;
      xkb.layout = "us";
      xkb.variant = "";
      displayManager.gdm = {
        enable = true;
        wayland = true;
      };
    };
    libinput = {
      enable = true;
      # mouse = {
      #   accelProfile = "flat";
      # };
    };
  };
  # To prevent getting stuck at shutdown
  systemd.extraConfig = "DefaultTimeoutStopSec=10s";
}
