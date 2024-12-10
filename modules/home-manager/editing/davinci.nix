# Home-manager davinci-resolve configuration
{ lib, pkgs, osConfig, ... }: {
  home = lib.mkIf (osConfig.networking.hostName == "NixOS-Desktop") {
    packages = [
      davinci-resolve
    ];
    persistence."/persist/home/kassie".directories = [
      #
    ];
  };
}
