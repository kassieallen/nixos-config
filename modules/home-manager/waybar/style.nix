{ ... }:
let custom = {
  font = "JetBrainsMono Nerd Font";
  font_size = "14px";
  font_weight = "500";
};
in {
  programs.waybar.style = with custom; ''
    * {
      min-height: 0;
      font-family: ${font};
      font-size: ${font_size};
      font-weight: ${font_weight};
    }

    window#waybar {
      transition-property: background-color;
      transition-duration: 0.5s;
      background-color: rgba(0, 0, 0, 0);
    }

    tooltip {
      border-radius: 8px;
    }

    #workspaces button {
      padding: 2px 10px;
      margin: 4px 4px;
      border-radius: 8px;
      background-color: #2a2a2d;
      color: #757581;
    }

    #workspaces button.active {
      color: #c9c7cd;
      background-color: #131314;
    }

    #workspaces button.urgent {
      background-color: #f38ba8;
    }

    #clock, #network, #pulseaudio, #tray, #network, #custom-music-player, #custom-logo {
      padding: 2px 10px;
      margin: 4px 4px;
      border-radius: 8px;
      background-color: #131314;
      color: #c9c7cd;
    }

    #custom-music-player.playing {
      color: #c9c7cd;
    }

    #custom-music-player.paused {
      color: #757581;
    }

    window#waybar.empty #window {
      background-color: transparent;
    }

    #clock.simpleclock {
      color: #c9c7cd;
    }

    #window {
      padding: 2px 10px;
      margin: 4px 4px;
      border-radius: 8px;
      background-color: #131314;
      color: #aca1cf;
    }

    #pulseaudio.muted {
      color: #f38ba8;
    }

    #custom-logo {
      color: #89b4fa;
    }

    @keyframes blink {
      to {
        background-color: #f38ba8;
        color: #131314;
      }
    }

    #tray menu {
      background: rgb(24, 24, 37);
      color: white;
    }
  '';
}
