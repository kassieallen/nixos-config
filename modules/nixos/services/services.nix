# Miscellaneous services
{ ... }: {
  services = {
    gvfs.enable = true;
    gnome.gnome-keyring.enable = true;
    dbus.enable = true;
    openssh.enable = true;
    logind.extraConfig = ''
      # Don't shutdown when power button is short-pressed
      HandlePowerKey=ignore
    '';
  };
}
