# Steam configuration
{ lib, config, ... }: 
let
  inherit (lib) mkIf mkEnableOption;
  cfg = config.modules.steam;
in {
  options.modules.steam = {
    enable = mkEnableOption "Steam";
  };

  config = mkIf cfg.enable {
    programs.steam = {
      enable = true;
      remotePlay.openFirewall = true;
      dedicatedServer.openFirewall = true;
      gamescopeSession.enable = true;
    };
  };
}
