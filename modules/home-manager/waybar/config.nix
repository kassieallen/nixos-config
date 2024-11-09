# Waybar config
{ pkgs, host, ... }:
let custom = {
  font = "JetBrainsMono Nerd Font";
  font_size = "14px";
  font_weight = "500";
};
in {
  programs.waybar.settings.mainBar = with custom; {
    layer = "top";
    position = "top";
    height = 36;
    spacing = 4;
    exclusive = true;
    passthrough = false;
    fixed-center = true;

    modules-left = [
      "custom/logo"
      "hyprland/workspaces"
      "hyprland/window"
    ];
    modules-center = [
      "custom/music_player"
    ];
    modules-right = [
      "tray"
      "pulseaudio"
      "pulseaudio#microphone"
      "network"
      "clock#date"
      "clock"
    ];

    "custom/logo" = {
      format = " ";
      tooltip = false;
      return-type = "json";
      exec-if = "which swaync-client";
      exec = "swaync-client -swb";
      on-click = "swaync-client -t -sw";
      on-click-right = "swaync-client -d -sw";
      escape = true;
    };
    "hyprland/workspaces" = {
      format = "{name}";
      all-outputs = true;
      active-only = false;
    };
    "hyprland/window" = {
      format = "{}";
      disable-scroll = false;
      # rewrite = { "(.{42}).*": "$1.." };
    };
    "custom/music_player" = {
      interval = 1;
      format = "{}";
      return-type = "json";
      # exec = pkgs.writeScriptBin "music_player" ./music_player.sh grep;
      on-click = "playerctl previous";
      on-click-middle = "playerctl play-pause";
      on-click-right = "playerctl next";
    };
    tray = {
      show-passive-items = true;
      spacing = 10;
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
    };
    "pulseaudio#microphone" = {
      format = "{format_source}";
      format-source = " {volume}%";
      format-source-muted = "";
      on-click = "pavucontrol -t 4";
      on-scroll-up = "~/.config/hypr/scripts/volume.sh --mic-inc";
      on-scroll-down = "~/.config/hypr/scripts/volume.sh --mic-dec";
      tooltip-format = "{source_desc} | {source_volume}%";
    };
    network = {
      tooltip = false;
      format = "{}";
      on-click = "kitty nmtui";
      format-wifi = "{icon} {essid} ({signalStrength}%)";
      format-ethernet = "{ifname}: {ipaddr}/{cidr}  ";
      formai-disconnected = "Disconnected ";
      format-alt = "{ifname}: {ipadr}/{cidr}";
      format-icons = [ "󰤯 " "󰤟 " "󰤢 " "󰤨 " ];
    };
    "clock#date" = {
      format = "  {:L%a %d %b}";
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
    clock = {
      tooltip = false;
      format = "  {:%H:%M}";
    };
  };
} 
