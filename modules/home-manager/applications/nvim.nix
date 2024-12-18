# Home-manager neovim configuration
{ lib, config, pkgs, username, ... }:
let
  inherit (lib) mkIf mkEnableOption;
  cfg = config.modules.applications.neovim;
in {
  options.modules.applications.neovim = {
    enable = mkEnableOption "Neovim";
  };

  config = mkIf cfg.enable {
    programs.neovim = {
      enable = true;
      vimAlias = true;
      defaultEditor = true;
      extraPackages = with pkgs; [
        lua-language-server
        nil
        rustup
      ];
    };

    home = {
      packages = with pkgs; [
        cargo
        lazygit
        rustc
        nixfmt-rfc-style
      ];
      persistence."/persist/home/${username}".directories = [
        ".local/share/nvim"
        ".config/nvim"
      ];
    };
  };
}
