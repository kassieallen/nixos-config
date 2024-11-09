# NixOS default modules - services
{ inputs, nixpkgs, self, username, host, ... }: {
  imports = [
    ./flatpak.nix
    ./network.nix
    ./nvidia.nix
    ./pipewire.nix
    ./security.nix
    ./services.nix
  ];
}
