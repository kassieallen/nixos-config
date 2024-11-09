# Hypridle config
{ pkgs, ... }: {
  home.packages = [ pkgs.hypridle ];
  xdg.configFile."hypr/hypridle.conf" = ''
    general {
      lock_cmd = pidof hyprlock || hyprlock
    }

    listener {
      timeout = 300
      on-timeout = hyprlock
    }
  '';
}
