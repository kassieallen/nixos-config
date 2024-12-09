# Home-manager impermanence configuration
{ inputs, ... }: {
  imports = [ inputs.impermanence.homeManagerModules.impermanence ];

  home.persistence."/persist/home/kassie" = {
    directories = [
      ".cache/flatpak"
      ".config/gh" # kinda need this one
      ".config/nixos"
      ".config/nvim"
      ".local/share/flatpak"
      ".local/share/nvim"
      ".local/share/Steam"
      ".local/share/PrismLauncher"
      ".var/app"
      ".mozilla"
      "Documents"
      "Downloads"
      "Music"
      "Pictures"
      "Videos"
    ];
    files = [
      ".bash_history"
    ];
    allowOther = true;
  };
}
