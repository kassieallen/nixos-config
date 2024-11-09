# Miscellaneous programs
{ pkgs, lib, ... }: {
  programs = {
    nix-ld.enable = true;
    nix-ld.libraries= with pkgs; [  ];
    dconf.enable = true;
    gnupg.agent = {
      enable = true;
      enableSSHSupport = true;
    };
    starship.enable = true;
  };
}
