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
    steam = {
      enable = true;
      remotePlay.openFirewall = true; # Open ports in the firewall for Steam Remote Play
      dedicatedServer.openFirewall = true; # Open ports in the firewall for Source Dedicated Server
      localNetworkGameTransfers.openFirewall = true; # Open ports in the firewall for Steam Local Network Game Transfers
      gamescopeSession.enable = true;
    };
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
