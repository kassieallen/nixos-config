# NixOS desktop configuration
{ config, ... }: {
  imports = [
    ./hardware-configuration.nix
    ./nvidia.nix
    ../../modules/system
  ];

  # the problem...
  modules = {
    gaming = {
      mcje.enable = true;
    };
  };
}
