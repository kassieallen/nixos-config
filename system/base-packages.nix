# Base system packages
{ pkgs, inputs, ... }: {
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
    river.enable = true;
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
  };
}
