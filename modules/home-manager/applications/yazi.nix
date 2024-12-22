# Home-manager yazi configuration
{ lib, config, pkgs, ... }:
let
  inherit (lib) mkIf mkEnableOption;
  cfg = config.modules.applications.yazi;
in {
  options.modules.applications.yazi = {
    enable = mkEnableOption "Yazi";
  };

  config = mkIf cfg.enable {
    home = {
      packages = [ pkgs.yazi ];
      file.".config/yazi/yazi.toml".text = ''
        [manager]
        show_hidden = true
      '';
    };
  };
}
