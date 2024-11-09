# NixOS default modules - programs
{ inputs, nixpkgs, self, username, host, ... }: {
  imports = [
    ./bootloader.nix
    ./hardware.nix
    ./programs.nix
    ./wayland.nix
    ./xserver.nix
  ];
}
