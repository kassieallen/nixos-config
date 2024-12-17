# Security configuration
{ lib, config, pkgs, ... }:
let
  inherit (lib) mkIf mkEnableOption;
  cfg = config.modules.security;
in {
  options.modules.security = {
    enable = mkEnableOption "Security";
  };

  config = mkIf cfg.enable {
    security = {
      polkit.enable = true;
      rtkit.enable = true;
      pam = {
        loginLimits = [
          {
            domain = "@users";
            item = "rtprio";
            type = "-";
            value = "1";
          }
        ];
      };
    };
    environment.sessionVariables = {
      POLKIT_AUTH_AGENT = "${pkgs.polkit_gnome}/libexec/polkit-gnome-authentication-agent-1";
    };
  };
}
