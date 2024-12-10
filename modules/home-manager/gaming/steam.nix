# Home-manager steam configuration
{ lib, pkgs, osConfig, ... }: {
  home = lib.mkIf (osConfig.networking.hostName == "NixOS Desktop") {
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
}
