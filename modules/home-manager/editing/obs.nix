# Home-manager OBS configuration
{ lib, config, pkgs, ... }: 
let
  inherit (lib) mkIf mkEnableOption;
  cfg = config.modules.editing.obs;
in {
  options.modules.editing.obs = {
    enable = mkEnableOption "OBS Studio";
  };
  
  config = mkIf cfg.enable {
    home = {
      packages = with pkgs; [
        obs-studio
      ];
      persistence."/persist/home/kassie".directories = [
        #
      ];
    };
  };
}
