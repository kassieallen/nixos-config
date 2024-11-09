# Miscellaneous packages
{ inputs, pkgs, ... }: {
  home.packages = (with pkgs; [
    ## CLI
    appimage-run          # AppImage compatibilty
    cbonsai               # Pretty terminal tree :3
    ffmpeg                # Manipulate, convert and stream multimedia content
    gtt                   # Google translate TUI
    hexdump               # Hex tool
    imv                   # Image viewer
    lazygit               # Also used for neovim
    libnotify             # Swaync req
    mpv                   # Video player
    pamixer               # PulseAudio command line mixer
    playerctl             # Controller for media players
    ripgrep               # Grep replacement, also used for neovim
    swww                  # Wallpaper configurator
    unzip                 # Surprisingly not included
    wl-clipboard          # Clipboard utilities for wayland
    wget                  # Download files from internet!
    xdg-utils             # Helpful XDG tools
    xxd                   # Hex-dump binaries and back again!
    yt-dlp                # Audio/video downloader

    ## GUI
    audacity              # Audio editing and recording
    davinci-resolve       # Video editin'
    firefox               # Internet browser
    gimp                  # Image editor
    github-desktop        # GUI for managing Git and Github
    libreoffice           # Office suite (documents, powerpoints, spreadsheets, etc)
    nautilus              # File explorer
    nix-prefetch-github   # Helpful for getting source info
    obs-studio            # Screen & audio recording software
    pavucontrol           # PulseAudio volume controller GUI
    qalculate-gtk         # Calculator
    spotify               # Music streaming platform
    vesktop               # Discord client
    vlc                   # Cross-platform multimedia player
    zenity                # Allows executions of dialog boxes in command-line and shell scripts

    ## Development
    gcc                   # GNU C compiler
    gdb                   # GNU debugger
    nil                   # Nix language server, used for neovim
    rustup                # Rust, used for neovim

  ]); 
}
