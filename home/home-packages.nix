# Home-manager packages
{ pkgs, inputs, ... }: {
  imports = [ inputs.nix-flatpak.homeManagerModules.nix-flatpak ];

  home = {
    username = "kassie";
    homeDirectory = "/home/kassie";
    stateVersion = "24.05";
    packages = with pkgs; [
      # CLI
      btop            # Resource monitor
      cbonsai         # Pretty tree :3
      fastfetch       # System information tool
      feh             # Image viewer
      gcc             # GNU C compiler
      gdb             # GNU debugger
      grim            # Used with slurp for screenshots
      hexdump         # Hex tool
      lazygit         # Helpful git tool
      libnotify       # Notifications!
      mpv             # Media player
      pamixer         # Audio controller
      playerctl       # Media controller
      slurp           # Used with grim for screenshots
      swww            # Wallpaper configurator
      wl-clipboard    # Clipboard manager
      xxd             # Hex-dump binaries and back again!
      yazi            # File manager
      yt-dlp          # Audio/video downloader
      zenity          # Allows executions of dialog boxes in command-line and shell scripts

      # GUI
      audacity        # Audio editor and recorder
      davinci-resolve # Video editin'
      foot            # Terminal emulator
      fuzzel          # Application launcher
      libreoffice     # Office suite
      mako            # Notification daemon
      obs-studio      # Screen & audio recording software
      prismlauncher   # Minecraft: java edition
      yambar          # Status panel
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
#     overrides = {
#       global = {
#         # Force wayland by default
#         Context.sockets = [ "wayland" "!x11" "!fallback-x11" ];
#       };
#     };
  };
}
