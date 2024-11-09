# Kitty config
{ pkgs, ... }: {
  programs.kitty = {
    enable = true;
    font = {
      name = "JetBrainsMono Nerd Font";
      size = 11;
    };
    settings = {
      confirm_os_window_close = 0;
      background_opactity = "0.65";
    };
  };
}
