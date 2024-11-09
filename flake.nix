# NixOS configuration flake
{
  description = "Kassie's NixOS flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    nur.url = "github:nix-community/NUR";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    hyprland.url = "github:hyprwm/Hyprland";

    nix-flatpak.url = "github:gmodena/nix-flatpak";
  };

  outputs = { self, nixpkgs, home-manager, hyprland, ... }@inputs:
  let
    username = "kassie";
    system = "x86_64-linux";
    pkgs = import nixpkgs {
      inherit system;
      config.allowUnfree = true;
    };
    lib = nixpkgs.lib;
  in {
    nixosConfigurations = {
      desktop = nixpkgs.lib.nixosSystem { # ~/.config/nixos#desktop
        specialArgs = { host="desktop"; inherit self inputs username system; };
        modules = [ ./hosts/desktop ];
      };
      laptop = nixpkgs.lib.nixosSystem { # ~/.config/nixos#laptop
        specialArgs = { host="laptop"; inherit self inputs username system; };
        modules = [ ./hosts/laptop ];
      };
    };
  };
}
