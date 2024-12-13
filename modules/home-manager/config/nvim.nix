# Home-manager neovim configuration
{ pkgs, ... }: {
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
    packages = [
      
    ];
    persistence."/persist/home/kassie".directories = [
      ".local/share/nvim"
      ".config/nvim"
    ];
  };
}
