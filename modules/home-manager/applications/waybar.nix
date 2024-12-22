# Home-manager waybar configuration
{ config, lib, pkgs, ... }:
let
  inherit (lib) mkIf mkEnableOption;
  cfg = config.modules.applications.waybar;

  powerMenu = pkgs.writeShellScriptBin "powerMenu.sh" ''
    #!/usr/bin/env bash
    op=$(echo -e " Poweroff\n Reboot\n Lock\n Logout" | ${pkgs.fuzzel}/bin/fuzzel -i --dmenu | ${pkgs.gawk}/bin/awk '{print tolower($2)}')

    case $op in 
      poweroff)
        ;&
      reboot)
        ;&
      lock)
        swaylock
        ;;
      logout)
        swaymsg exit
        ;;
    esac
  '';

  # TODO: fix when pulse is killed
  musicPlayer = pkgs.writeShellScriptBin "musicPlayer.sh" ''
    #!/usr/bin/env bash
    killall playerctl &>/dev/null

    while which playerctl &>/dev/null ; do
      playerctl -p spotify metadata -f '{{ status }}{{ title }}' --follow 2>/dev/null | while read status ; do
        case $status in
          Playing*)
            playerctl metadata -f "{{ artist }} - {{ title }}"
            ;;
          Paused*)
            echo "-"
            ;;
          **)
            echo ""
            ;;
        esac
      done
      sleep 10
    done
  '';
in {
  options.modules.applications.waybar = {
    enable = mkEnableOption "Waybar";
  };

  config = mkIf cfg.enable {
    programs.waybar = {
      enable = true;
      settings.mainBar = {
        layer = "top";
        position = "top";
        height = 26;

        modules-left = [ "custom/logo" "river/tags" "river/window" ];
        modules-center = [ "custom/musicPlayer" ];
        modules-right = [ 
          "tray"
          "pulseaudio"
          "pulseaudio#microphone"
          "network"
          "battery"
          "clock#date"
          "clock"
        ];

        "custom/logo" = {
          format = "";
          tooltip = false;
          on-click = "exec ${powerMenu}/bin/powerMenu.sh";
        };

        "river/window" = {
          format = {};
          max-length = 32;
        };

        "custom/musicPlayer" = {
          # interval = 1;
          format = {};
          exec = "${musicPlayer}/bin/musicPlayer";
          on-click = "playerctl previous";
          on-click-middle = "playerctl play-pause";
          on-click-right = "playerctl next";
        };

        tray = {
          show-passive-items = true;
          # spacing = 10;
        };

        pulseaudio = {
          format = "{icon} {volume}%";
          format-muted = "  muted";
          format-icons = {
            default = [" " " " " "];
            headphone = " ";
          };
          on-click-middle = "pamixer -t";
          on-click = "pavucontrol";
          on-scroll-up = "pamixer -i 1";
          on-scroll-down = "pamixer -d 1";
        };

        "pulseaudio#microphone" = {
          format = "{format_source}";
          format-source = " {volume}%";
          format-source-muted = "";
          on-click = "pavucontrol -t 4";
          tooltip-format = "{source_desc} | {source_volume}%";
        };
        
        "network" = {
          tooltip = false;
          format = "{}";
          on-click = "foot --app-id=float -e nmtui";
          format-wifi = "{icon} {dl-speed:mb}/{ul-speed:mb} Mb/s";
          format-ethernet = "{ifname}: {ipaddr}/{cidr}  ";
          format-disconnected = "Disconnected";
          format-alt = "{ifname}: {ipadr}/{cidr}";
          format-icons = [ "󰤯 " "󰤟 " "󰤢 " "󰤨 " ];
        };

        "battery" = {
          tooltip = false;
        };
        
        "clock#date" = {
          format = "{:L%a %d %b}";
          tooltip-format = "<tt>{calendar}</tt>";
          calendar = {
            mode = "month";
            mode-mon-col = 3;
            on-click-right = "mode";
            format = {
              months = "<span color='#f5e0dc'><b>{}</b></span>";
              weekdays = "<span color='#f9e2af'><b>{}</b></span>";
              today = "<span color='#f38ba8'><b>{}</b></span>";
            };
          };
          actions = { on-click-right = "mode"; };
          min-length = 8;
          max-length = 28;
        };

        "clock" = {
          tooltip = false;
          format = "{%I:%M %p}";
        };
      };

      style = ''
        * {
          background-color: #131314;
          border: none;
          border-radius: 0;
          color: #C9C7CD;
          font-family: JetBrainsMono Nerd Font;
          font-size: 11px;
          margin: 0;
          padding: 0;
        }

        window#waybar {
          transition-property: background-color;
          transition-duration: 0.5s;
          background-color: rgba(19, 19, 20, 0.94);
        }

        #custom-logo {
          font-size: 18px;
          margin: 0;
          margin-left: 7px;
          margin-right: 12px;
          padding: 0;
        }

        #workspaces button {
          margin: 4px 4px;
          color: #C9C7CD;
        }

        #workspaces button.focused {  # potentially called `active`
          background-color: #2A2A2D;
        }

        #workspaces button.urgent {
          background-color: #EA83A5;
          color: #131314;
        }

        #window {
          padding: 2px 10px;
          margin: 4px 4px;
          color: #ACA1CF;
        }

        #custom-musicPlayer.playing {
          color: #C9C7CD;
        }

        #custom-musicPlayer.paused {
          color: #757581;
        }

        #tray menu {
          background-color: #131314;
          color: #C9C7CD
        }

        #pulseaudio.muted {
          color: #EA83A5;
        }
      '';
    };
  };
}
