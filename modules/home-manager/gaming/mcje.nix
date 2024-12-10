# Home-manager minecraft configuration
{ lib, pkgs, osConfig, ... }: {
  home = lib.mkIf (osConfig.networking.hostName == "NixOS Desktop") {
    packages = with pkgs; [
      prismlauncher
    ];
    persistence."/persist/home/kassie" = {
      directories = [
        ".local/share/PrismLauncher"
      ];
    };
  };
}
