# Home-manager riverWM configuration
{ lib, config, pkgs, ... }:
let
  inherit (lib) mkIf mkEnableOption;
  cfg = config.modules.applications.riverwm;
  
  rootPath = ../../../.;
  wallpaper = "${rootPath}/wallpapers/white_flowers.png";
in {
  options.modules.applications.riverwm = {
    enable = mkEnableOption "RiverWM";
  };

  config = mkIf cfg.enable {
    programs.bash = {
      enable = true;
      initExtra = ''
        if [ -z "$WAYLAND_DISPLAY" ] && [ $(tty) = "/dev/tty1" ]; then
          exec dbus-run-session -- river
        fi
      '';
    };
  
    wayland.windowManager.river = {
      enable = true;
      extraConfig = ''
        rivertile -view-padding 4 -outer-padding 4 -main-ratio 0.5 &
      
        for i in $(seq 1 9)
        do
          tags=$((1 << ($i - 1)))

          riverctl map normal Super $i set-focused-tags $tags
          riverctl map normal Super+Shift $i set-view-tags $tags
          riverctl map normal Super+Control $i toggle-focused-tags $tags
          riverctl map normal Super+Shift+Control $i toggle-view-tags $tags
        done

        all_tags=$(((1 << 16) - 1))
        riverctl map normal Super 0 set-focused-tags $all_tags
        riverctl map normal Super+Shift 0 set-view-tags $all_tags

        for mode in normal locked
        do
          riverctl map $mode None XF86AudioRaiseVolume spawn 'pamixer -i 5'
          riverctl map $mode None XF86AudioLowerVolume spawn 'pamixer -d 5'
          riverctl map $mode None XF86AudioMute spawn 'pamixer --toggle-mute'
          riverctl map $mode None XF86AudioMedia spawn 'playerctl play-pause'
          riverctl map $mode None XF86AudioPlay spawn 'playerctl play-pause'
          riverctl map $mode None XF86AudioNext spawn 'playerctl next'
          riverctl map $mode None XF86AudioPrev spawn 'playerctl previous'
        done
      '';

      settings = {
        default-layout = "rivertile";
        spawn = [
          "mako"
          "'playerctld daemon'"
          "swww-daemon"
          "'swww img ${wallpaper} --transition-type none'"
          "yambar"
        ];
        map = {
          normal = {
            "Control+Alt Delete" = "exit";
            "None Print" = "spawn 'grim -l 0 -g \"$(slurp)\" - | wl-copy --type image/png'";
            "Super Space" = "spawn 'fuzzel'";
            "Super Return" = "spawn 'foot'";
            "Super C" = "close";
            "Super T" = "toggle-float";
            "Super F" = "toggle-fullscreen";
            "Super E" = "spawn 'foot -e yazi'";
            
            "Super K" = "focus-view next";
            "Super J" = "focus-view previous";
            "Super+Shift K" = "swap next";
            "Super+Shift J" = "swap previous";
            "Super Period" = "focus-output next";
            "Super Comma" = "focus-output previous";
            "Super+Shift Period" = "send-to-output next";
            "Super+Shift Comma" = "send-to-output previous";
            "Super H" = "send-layout-cmd rivertile 'main-ratio -0.05'";
            "Super L" = "send-layout-cmd rivertile 'main-ratio +0.05'";
            "Super+Shift H" = "send-layout-cmd rivertile 'main-count -1'";
            "Super+Shift L" = "send-layout-cmd rivertile 'main-count +1'";
            "Super Up" = "send-layout-cmd rivertile 'main-location top'";
            "Super Down" = "send-layout-cmd rivertile 'main-location bottom'";
            "Super Left" = "send-layout-cmd rivertile 'main-location left'";
            "Super Right" = "send-layout-cmd rivertile 'main-location right'";
          };
        };
        map-pointer = {
          normal = {
            "Super BTN_LEFT" = "move-view";
            "Super BTN_RIGHT" = "resize-view";
          };
        };
        background-color = "0x000000";
        border-color-focused = "0x757581";
        border-color-unfocused = "0x2a2a2d";
        focus-follows-cursor = "always";
        set-cursor-warp = "on-focus-change";
        set-repeat = "50 300";
        rule-add = [
          "-app-id 'float' float"
          "ssd"
        ];
      };
    };

    home.packages = with pkgs; [
      grim
      libnotify
      pamixer
      playerctl
      slurp
      swww
      wl-clipboard
      zenity
    ];
  };
}
