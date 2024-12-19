# Home-manager lutris configuration
{ lib, config, pkgs, username, ... }: 
let
  inherit (lib) mkIf mkEnableOption;
  cfg = config.modules.gaming.lutris;
in {
  options.modules.gaming.lutris = {
    enable = mkEnableOption "Lutris";
  };

  config = mkIf cfg.enable {
    home = {
      packages = with pkgs; [
        steam-tui
        steamcmd
        lutris
      ];
      persistence."/persist/home/${username}" = {
        directories = [
          ".cache/lutris"
          ".local/share/lutris"
          ".mono"
          "Games"
        ];
      };
    };
  };
}
