# Home-manager minecraft configuration
{ lib, config, pkgs, username, ... }:
let
  inherit (lib) mkIf mkEnableOption;
  cfg = config.modules.gaming.mcje;
in {
  options.modules.gaming.mcje = {
    enable = mkEnableOption "MCJE";
  };

  config = mkIf cfg.enable {
    home = {
      packages = with pkgs; [
        prismlauncher
      ];
      persistence."/persist/home/${username}".directories = [
        ".local/share/PrismLauncher"
      ];
    };
  };
}
