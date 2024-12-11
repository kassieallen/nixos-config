# NixOS desktop configuration
{ config, ... }: {
  imports = [
    ./hardware-configuration.nix
    ./nvidia.nix
    ../../modules/system
  ];
}
