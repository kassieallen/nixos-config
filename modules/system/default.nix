# System default
{ inputs, ... }: {
  imports = [
    inputs.disko.nixosModules.default
    ../hardware-configuration.nix
    ./base-packages.nix
    ./base-persist.nix
    ./boot.nix
    ./disko.nix
    ./fonts.nix
    ./network.nix
    ./nix-settings.nix
    ./nvidia.nix
    ./polkit.nix
    ./printing.nix
    ./security.nix
    ./sound.nix
    ./time-locale.nix
    ./users.nix
    ./xdgPortal.nix
  ];
}
