# Home-manager git configuration
{ lib, config, pkgs, ... }:
let
  inherit (lib) mkIf mkEnableOption;
  cfg = config.modules.development.git;
in {
  options.modules.development.git = {
    enable = mkEnableOption "Git";
  };

  config = mkIf cfg.enable {
    programs.git = {
      enable = true;
      userName = "kassieallen";
      userEmail = "kasallen.21@gmail.com";
      extraConfig = {
        init.defaultBranch = "main";
        credential.help = "store";
        merge.conflictstyle = "diff3";
        diff.colorMoved = "default";
      };

      delta = {
        enable = true;
        options = {
          line-numbers = true;
          side-by-side = true;
          diff-so-fancy = true;
          navigate = true;
        };
      };
    };

    home = {
      packages = [ pkgs.gh ];
      persistence."/persist/home/kassie".directories = [ ".config/gh" ];
    };
  };
}
