# Home-manager GTK configuration
{ pkgs, ... }: {
  fonts.fontconfig.enable = true;
  gtk = {
    enable = true;
    theme = {
      package = pkgs.gnome-themes-extra;
      name = "Adwaita-dark";
    };
    cursorTheme = { name = "Posy_Cursor_Black"; };
  };

  home.pointerCursor = {
    package = pkgs.posy-cursors;
    name = "Posy_Cursor_Black";
    size = 32;
    gtk.enable = true;
  };
}
