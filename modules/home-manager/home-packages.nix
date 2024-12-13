# Home-manager packages
{ pkgs, inputs, ... }: {
  imports = [ inputs.nix-flatpak.homeManagerModules.nix-flatpak ];

  home = {
    username = "kassie";
    homeDirectory = "/home/kassie";
    stateVersion = "24.05";
    packages = with pkgs; [
      # CLI
      appimage-run    # AppImage compatibility
      btop            # Resource monitor
      cbonsai         # Pretty tree :3
      fastfetch       # System information tool
      feh             # Image viewer
      gcc             # GNU C compiler
      gdb             # GNU debugger
      grim            # Used with slurp for screenshots
      hexdump         # Hex tool
      lazygit         # Helpful git tool
      mpv             # Media player
      pamixer         # Audio controller
      playerctl       # Media controller
      slurp           # Used with grim for screenshots
      swww            # Wallpaper configurator
      wl-clipboard    # Clipboard manager
      xxd             # Hex-dump binaries and back again!
      yt-dlp          # Audio/video downloader

      # GUI
      libreoffice     # Office suite
    ];
    persistence."/persist/home/kassie".directories = [
      ".cache/flatpak"
      ".local/share/flatpak"
      ".var/app"
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
      "com.spotify.Client"
      "dev.vencord.Vesktop"
      "io.mrarm.mcpelauncher"
    ];
  };
}
