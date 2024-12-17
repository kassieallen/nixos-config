# Font configuration
{ config, lib, pkgs, ... }:
let
  inherit (lib) mkIf mkEnableOption;
  cfg = config.modules.fonts;
in {
  options.modules.fonts = {
    enable = mkEnableOption "Fonts";
  };
  config = mkIf cfg.enable {
    fonts.fontDir.enable = true;
    fonts.packages = with pkgs; [
      nerd-fonts.jetbrains-mono
      noto-fonts
      noto-fonts-cjk-sans
      noto-fonts-emoji
    ];
  };
}
