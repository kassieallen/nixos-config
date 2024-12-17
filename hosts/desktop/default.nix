# NixOS desktop configuration
{ config, ... }: {
  imports = [
    ./hardware-configuration.nix
    ./nvidia.nix
    ../../modules/system
  ];

  home-manager.users.kassie.modules = {
    development = {
      freecad.enable = true;
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
  };
}
