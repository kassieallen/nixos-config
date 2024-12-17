# Home-manager mako configuration
{ lib, config, ... }:
let
  inherit (lib) mkIf mkEnableOption;
  cfg = config.modules.applications
in {
  options.modules.applications.mako = {
    enable = mkEnableOption "Mako Notification Daemon";
  };

  config = mkIf cfg.enable {
    home.file.".config/mako/config".text = ''
      font=JetBrainsMono Nerd Font 10
      anchor=top-center
      background-color=#131314e6
      text-color=#c9c7cdff
      border-color=#1b1b1de6
      max-icon-size=32
      default-timeout=5000
    '';
  };
}
