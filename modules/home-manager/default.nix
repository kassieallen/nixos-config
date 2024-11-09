# Home-manager configuration file
{ inputs, username, host, ... }: {
  imports = [
    # ./ags                 # Aylur's GTK shell
    ./hypr                  # Hyprland & friends        # SUS
    ./nvim                  # Neovim config
    ./gaming.nix            # Packages related to gaming
    ./gtkqt.nix             # GTK and QT themes                 # SUS
    ./kitty.nix             # Kitty terminal
    ./packages.nix          # Miscellaneous packages
    ./starship.nix          # Shell prompt
    ./xdg-mimes.nix         # XDG config

    # Replace w/ AGS:
    ./swaync/swaync.nix     # Sway notification center
    ./waybar                # Status bar
    ./wofi.nix              # Application Launcher    # SUS
  ];
}
