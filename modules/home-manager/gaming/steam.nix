# Home-manager steam configuration
{ lib, config, pkgs, username, ... }: 
let
  inherit (lib) mkIf mkEnableOption;
  cfg = config.modules.gaming.steam;
in {
  options.modules.gaming.steam = {
    enable = mkEnableOption "Steam";
  };

  config = mkIf cfg.enable {
    home = {
      packages = with pkgs; [
        steam-tui
        steamcmd
      ];
      persistence."/persist/home/${username}" = {
        directories = [
          ".steam"
          ".local/share/Steam"
          ".local/share/vulkan"
        ];
      };
    };
  };
}
