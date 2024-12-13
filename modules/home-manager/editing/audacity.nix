# Home-manager audacity module
{ lib, config, pkgs, ... }: 
let
  inherit (lib) mkIf mkEnableOption;
  cfg = config.modules.editing.audacity;
in {
  options.modules.editing.audacity = {
    enable = mkEnableOption "Audacity";
  };

  config = mkIf cfg.enable {
    home.packages = with pkgs; [ audacity ];
  };
}
