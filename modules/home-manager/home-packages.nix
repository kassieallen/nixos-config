# Home-manager packages
{ lib, config, pkgs, inputs, username, ... }:
let
  inherit (lib) mkIf mkEnableOption;
  cfg = config.modules.packages;
in {
  imports = [ inputs.nix-flatpak.homeManagerModules.nix-flatpak ];

  options.modules.packages = {
    enable = mkEnableOption "HM Packages";
  };

  config = mkIf cfg.enable {
    home = {
      username = "${username}";
      homeDirectory = "/home/${username}";
      stateVersion = "24.05";
      packages = with pkgs; [
        # CLI
        appimage-run    # AppImage compatibility
        btop            # Resource monitor
        cbonsai         # Pretty tree :3
        nitch           # System information tool
        feh             # Image viewer
        gcc             # GNU C compiler
        gdb             # GNU debugger
        hexdump         # Hex tool
        mpv             # Media player
        usbutils        # USB utilities and tools
        xxd             # Hex-dump binaries and back again!
        yt-dlp          # Audio/video downloader

        # GUI
        libreoffice     # Office suite
        spotify         # Music streaming service
        vesktop         # Discord client
      ];
      persistence."/persist/home/${username}".directories = [
        ".cache/flatpak"
        ".cache/spotify"
        ".config/spotify"
        ".config/vesktop" 
        ".local/share/flatpak"
        ".var/app/io.mrarm.mcpelauncher"
      ];
    };

    services.flatpak = {
      enable = true;
      remotes = [
        {
          name = "flathub";
          location = "https://dl.flathub.org/repo/flathub.flatpakrepo";
        }
      ];
      packages = [
        "io.mrarm.mcpelauncher"
      ];
    };
  };
}
