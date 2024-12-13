# Home-manager impermanence configuration
{ inputs, ... }: {
  imports = [ inputs.impermanence.homeManagerModules.impermanence ];

  home.persistence."/persist/home/kassie" = {
    directories = [
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
