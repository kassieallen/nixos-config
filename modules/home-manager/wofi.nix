# Wofi config
{ pkgs, ... }: {
  home.packages = with pkgs; [ wofi ];
  
  xdg.configFile."wofi/config".text = ''
    mode=drun,run
    allow_images=true
    hide_scroll=true
    insensitive=true
    term=kitty
    prompt= 
  '';

  xdg.configFile."wofi/theme.css".text = ''
    * {
      outline: none;
    }

    window {
      font-family: JetBrainsMono Nerd Font;
      margin: 4px;
      border: 2px solid #1b1b1d;
      border-radius: 8px;
      color: #c9c7cd;
      background-color: #131314;
      opacity: 0.9;
    }

    #input {
      margin: 8px;
      border: 2px solid #1b1b1d;
      border-radius: 8px;
      color: #c9c7cd;
      background-color: #131314;
      box-shadow: none;
    }

    #inner-box {
      margin: 8px;
      color: #c9c7cd;
      background-color: transparent;
    }

    #outer-box {
      border: 2px solid #1b1b1d;
      border-radius: 8px;
      color: #c9c7cd;
      background-color: #131314;
      opacity: 0.9;
    }

    #scroll {
      margin: 8px;
      border: 2px solid #1b1b1d;
      border-radius: 8px;
      color: #c9c7cd;
      background-color: #131314;
    }

    #text {
      margin: 8px;
    }

    #entry {
      border: none;
    }

    #entry:focus {
      border: none;
    }

    #entry:selected {
      background-color: #1b1b1d;
      border: none;
      border-radius: 4px;
    } 
  '';
}
