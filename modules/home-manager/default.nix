# Home-manager default configuration
{
  imports = [
    ./configs
    ./editing
    ./gaming
    ./envVars.nix
    ./gtk.nix
    ./home-packages.nix
    ./home-persist.nix
    ./xdg.nix
  ];

  nixpkgs.config.allowUnfree = true;
  programs.home-manager.enable = true;
}
