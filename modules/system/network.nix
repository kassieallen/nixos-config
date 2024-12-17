# Networking configuration
{ lib, config, ... }:
let
  inherit (lib) mkIf mkEnableOption;
  cfg = config.modules.networking;
in {
  options.modules.networking = {
    enable = mkEnableOption "Networking";
  };

  config = mkIf cfg.enable {
    networking = {
      hostName = "NixOS";
      networkmanager = {
        enable = true;
      };
      nameservers = [ "1.1.1.1" "1.0.0.1" ];
      firewall = {
        enable = true;
        allowPing = false;
        logReversePathDrops = true;
      };
    };
  };
}
