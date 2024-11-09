# NixOS configuration
{ pkgs, ... }: {
  imports = [
    ./hardware-configuration.nix
    ./../../modules/nixos
  ];
}
