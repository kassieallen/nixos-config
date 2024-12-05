# Home-manager neovim configuration
{ pkgs, ... }: {
  programs.neovim = {
    enable = true;
    vimAlias = true;
    defaultEditor = true;
  };
}
