# Flatpak
{ inputs, pkgs, ... }: {
  imports = [ inputs.nix-flatpak.nixosModules.nix-flatpak ];

  services.flatpak = {
    enable = true;
    packages = [
      # List packages to install here:
      # "io.github.zen_browser.zen"
    ];
    overrides = {
      global = {
        # Force wayland by default
        Context.sockets = [ "wayland" "!x11" "!fallback-x11" ];
      };
    };
  };
}
