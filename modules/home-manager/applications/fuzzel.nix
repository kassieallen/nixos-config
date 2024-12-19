# Home-manager fuzzel configuration
{ lib, config, ... }: 
let
  inherit (lib) mkIf mkEnableOption;
  cfg = config.modules.applications.fuzzel;
in {
  options.modules.applications.fuzzel = {
    enable = mkEnableOption "Fuzzel";
  };

  config = mkIf cfg.enable {
    home.file.".config/fuzzel/fuzzel.ini".text = ''
      font=JetBrainsMono Nerd Font
      prompt="> "
      icon-theme=Adwaita
      icons-enabled=yes

      lines=10
      width=50
      horizontal-pad=20
      vertical-pad=12
      inner-pad=0
      image-size-ratio=0.5
      layer=top
      exit-on-keyboard-focus-loss=yes

      [colors]
      background=131314f0
      text=757581ff
      prompt=757581ff
      input=c9c7cdff
      match=c9c7cdff
      selection=1b1b1df0
      selection-text=c9c7cdff
      selection-match=ea83a5ff
      border=1b1b1de6

      [border]
      width=2
      radius=0
    '';
  };
}
