# Home-manager configuration file
{ inputs, lib, config, pkgs, ... }: {
  # You can import other home-manager modules here 
  imports = [
    # If you want to use home-manager modules from other flakes (like nix-colors):
    # inputs.nix-colors.homeManagerModule

    # You can also split up your config and import pieces of it here:
    # ./nvim.nix
  ];

  nixpkgs = {
    # You can add overlays here
    overlays = [
      # overlay stuff
    ];
    # Configure the nixpkgs instance
    config = {
      allowUnfree = true;
      # Workaround for https://github.com/nix-community/home-manager/issues/2942
      allowUnfreePredicate = _: true;
    };
  };

  # Let home-manager install and maintain itself
  programs.home-manager.enable = true;
  programs.git.enable = true;

  home = {
    username = "kassie";
    homeDirectory = "/home/kassie";
# https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
    stateVersion = "24.05"; # Please read the comment before changing.
    packages = with pkgs; [
      # packages
    ];
    file = {
      # 
    };
    sessionVariables = {
      EDITOR = "nvim";
    };
  };
}
