# Base system packages
{ lib, config, pkgs, ... }:
let
  inherit (lib) mkIf mkEnableOption;
  cfg = config.modules.base-packages;
in {
  options.modules.base-packages = {
    enable = mkEnableOption "Base-system Packages";
  };

  config = mkIf cfg.enable {
    environment = {
      systemPackages = with pkgs; [
        polkit_gnome
        git
        unzip
        ripgrep
        tmux
      ];

      sessionVariables = {
        EDITOR = "nvim";
      };
    };

    programs = {
      dconf.enable = true;
      git.enable = true;
    };

    services = {
      gnome = {
        gnome-keyring.enable = true;
        # evolution-data-server.enable = true;
        # gnome-online-accounts.enable = true;
        # sushi.enable = true;
      };
      gvfs.enable = true;
      flatpak.enable = true;
      printing.enable = true;
    };
  };
}
