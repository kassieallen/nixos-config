# Home-manager minecraft configuration
{ config, lib, pkgs, ... }:
with lib;
let
  cfg = config.mcje;
in {
  options.mcje.enable = lib.mkEnableOption "MCJE";

  config = lib.mkIf cfg.enable {
    home {
      packages = with pkgs; [
        prismlauncher
      ];
      persistence."/persist/home/kassie".directories = [
        ".local/share/PrismLauncher"
      ];
    };
  };
}
