# Home-manager steam configuration
{ config, lib, pkgs, ... }: {
  options = {
    steam.enable = 
      lib.mkEnableOption "enables Steam";
  };

  config = lib.mkIf config.steam.enable {
    home = {
      packages = with pkgs; [
        steam-tui
        steamcmd
      ];
      persistence."/persist/home/kassie" = {
        directories = [
          ".steam"
          ".local/share/Steam"
          ".local/share/vulkan"
        ];
      };
    };
  };
}
