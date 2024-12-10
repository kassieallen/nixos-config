# Home-manager OBS configuration
{ lib, pkgs, osConfig, ... }: {
  home = lib.mkIf () {
    packages = [
      obs-studio
    ];
    persistence."/persist/home/kassie".directories = [
      #
    ];
  };
}
