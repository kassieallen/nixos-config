# NixOS desktop configuration
{ config, ... }: {
  imports = [
    ./hardware-configuration.nix
    ../../modules/system
    ./nvidia.nix
  ];

  # Custom NixOS modules
  modules = {
    graphics = {
      nvidia.enable = true;
    };
  };

  # Custom home-manager modules
  home-manager.users.kassie.modules = {
    applications = {
      firefox.enable = true;
      foot.enable = true;
      fuzzel.enable = true;
      mako.enable = true;
      neovim.enable = true;
      riverwm.enable = true;
      starship.enable = true;
      yambar.enable = true;
      yazi.enable = true;
    };
    development = {
      freecad.enable = true;
      git.enable = true;
    };
    editing = {
      audacity.enable = true;
      davinci-resolve.enable = true;
      obs.enable = true;
    };
    gaming = {
      mcje.enable = true;
      steam.enable = true;
    };
    gtk.enable = true;
    packages.enable = true;
    xdg-mimes.enable = true;
  };
}
