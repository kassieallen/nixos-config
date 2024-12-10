# NixOS desktop configuration
{ ... }: {
  imports = [
    ./hardware-configuration.nix
    ../../modules/system
  ];

  networking.hostName = "NixOS-Desktop";
}
