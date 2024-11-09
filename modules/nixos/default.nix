# NixOS default modules
{ inputs, nixpkgs, self, username, host, ... }: {
  imports = [
    ./system.nix
    ./user.nix
    ./programs
    ./services
  ];
}
