# Home-manager impermanence configuration
{ inputs, ... }: {
  imports = [ inputs.impermanence.homeManagerModules.impermanence ];

  home.persistence."/persist/home/kassie" = {
    directories = [
      ".cache/flatpak"

      ".config/foot"
      ".config/fuzzel"
      ".config/nixos"
      ".config/nvim"
      ".config/river"
      ".config/yambar"

      ".local/share/flatpak"
      ".local/share/nvim"
      ".var/app"
      ".mozzila"
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
