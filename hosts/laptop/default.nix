# NixOS laptop configuration
{ ... }: {
  imports = [
    ./hardware-configuration.nix
    ../../modules/system
  ];

  networking.hostName = "NixOS-Laptop";
}
