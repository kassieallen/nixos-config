# Home-manager CAD configuration
{ lib, config, pkgs, username, ... }: 
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
      persistence."/persist/home/${username}".directories = [
        ".config/FreeCAD"
        ".config/PrusaSlicer"
        ".local/share/FreeCAD"
        ".local/share/prusa-slicer"
      ];
    };
  };
}
