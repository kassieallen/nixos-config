# GTK configuration
{ pkgs, config, ... }: {
  fonts.fontconfig.enable = true;
  home.packages = with pkgs; [
    (nerdfonts.override { fonts = [ "JetBrainsMono" ]; })
    noto-fonts
    noto-fonts-cjk-sans
    noto-fonts-emoji
  ];

  gtk = {
    enable = true;
    font = {
      name = "JetBrainsMono Nerd Font";
      size = 11;
    };
    theme = {
      name = "Adwaita-dark";
      package = pkgs.gnome-themes-extra;
    };
    iconTheme = {
      name = "Papirus-Dark";
      package = pkgs.papirus-icon-theme.override {
        color = "black";
      };
    };
    cursorTheme = {
      name = "Posy-Cursors";
      package = pkgs.posy-cursors;
      size = 32;
    };
  };

  qt = {
    enable = true;
    platformTheme.name = "adwaita";
    style = {
      name = "Adwaita-dark";
      package = pkgs.gnome-themes-extra;
    };
  };

  home.pointerCursor = {
    name = "Posy-Cursors";
    package = pkgs.posy-cursors;
    size = 32;
  };
}
