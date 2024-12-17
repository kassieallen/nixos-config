# Home-manager CAD configuration
{ lib, config, pkgs, ... }: 
let
  inherit (lib) mkIf mkEnableOption;
  cfg = config.modules.development.freecad;
in {
  options.modules.development.freecad = {
    enable = mkEnableOption "FreeCAD";
  };

  config = mkIf cfg.enable {
    home = {
      packages = with pkgs; [
        freecad-wayland
        prusa-slicer
      ];
      persistence."/persist/home/kassie".directories = [
        #
      ];
    };
  };
}
