# Home-manager foot configuration
{ lib, config, ... }:
let
  inherit (lib) mkIf mkEnableOption;
  cfg = config.modules.applications.foot;
in {
  options.modules.applications.foot = {
    enable = mkEnableOption "Foot";
  };

  config = mkIf cfg.enable {
    programs.foot = {
      enable = true;
      settings = {
        main = {
          font = "JetBrainsMono Nerd Font:size=10";
          # pad = "4x0";
        };
        mouse = {
          hide-when-typing = "yes";
        };
        colors = {
          alpha = "0.94";
          background = "131314";
        };
      };
    };
  };
}
