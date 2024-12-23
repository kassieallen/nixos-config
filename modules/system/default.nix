# System default
{ inputs, ... }: {
  imports = [
    inputs.disko.nixosModules.default
    ./base-packages.nix
    ./base-persist.nix
    ./boot.nix
    ./disko.nix
    ./fonts.nix
    ./network.nix
    ./nix-settings.nix
    ./security.nix
    ./sound.nix
    ./steam.nix
    ./time-locale.nix
    ./users.nix
    ./xdg-portals.nix
  ];
}
