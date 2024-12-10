# NixOS desktop configuration
{ lib, ... }: {
  imports = [
    ./hardware-configuration.nix
    ../../modules/system
  ];

  # mc.enable = true;
  # steam.enable = true;
}
