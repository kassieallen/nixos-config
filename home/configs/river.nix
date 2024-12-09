{
  programs.river = {
    enable = true;
    extraPackages = {
      foot
      fuzzel
      libnotify
      mako
      yambar
      yazi
      zenity
    };
  };

  environment.etc."river/init".text = ''
    #!/usr/bin/env bash

    ## Initialisation ##
    # Layout generator
    riverctl default-layout rivertile
    rivertile -view-padding 4 -outer-padding 4 -main-ratio 0.5 &

    # Change wallpaper here:
    wallpaper=$HOME/Pictures/wallpapers/forest.jpg

    # Programs
    pkill mako
    pkill playerctld
    pkill swww-daemon
    pkill yambar

    riverctl spawn mako
    riverctl spawn "playerctld daemon"
    riverctl spawn swww-daemon
    riverctl spawn "swww img ${wallpaper} --transition-type none"
    riverctl spawn yambar

    ## Keybindings ##
    # General
    riverctl map normal Super Space spawn "fuzzel"
    riverctl map normal Super Return spawn "foot"
    riverctl map normal None Print spawn 'grim -l 0 -g "$(slurp)" - | wl-copy --type image/png'
    riverctl map normal Super C close
    riverctl map normal Super T toggle-float
    riverctl map normal Super F toggle-fullscreen
    riverctl map normal Super R spawn "$HOME/.config/river/init"
    riverctl map normal Super E spawn "foot -e yazi"
    riverctl map normal Control+Alt Delete exit

    # Windows and workspaces
    riverctl map normal Super J focus-view next
    riverctl map normal Super K focus-view previous 
    riverctl map normal Super+Shift J swap next
    riverctl map normal Super+Shift K swap previous

    riverctl map normal Super Period focus-output next
    riverctl map normal Super Comma focus-output previous
    riverctl map normal Super+Shift Period send-to-output next
    riverctl map normal Super+Shift Comma send-to-output previous

    riverctl map normal Super H send-layout-cmd rivertile "main-ratio -0.05"
    riverctl map normal Super L send-layout-cmd rivertile "main-ratio +0.05"
    riverctl map normal Super+Shift H send-layout-cmd rivertile "main-count +1"
    riverctl map normal Super+Shift L send-layout-cmd rivertile "main-count -1"

    riverctl map normal Super Up send-layout-cmd rivertile "main-location top"
    riverctl map normal Super Down send-layout-cmd rivertile "main-location bottom"
    riverctl map normal Super Left send-layout-cmd rivertile "main-location left"
    riverctl map normal Super Right send-layout-cmd rivertile "main-location right"

    # Mouse
    riverctl map-pointer normal Super BTN_LEFT move-view
    riverctl map-pointer normal Super BTN_MIDDLE toggle-float
    riverctl map-pointer normal Super BTN_RIGHT resize-view

    for i in $(seq 1 9)
    do
      tags=$((1 << ($i -1)))

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

    ## Look and Feel ##
    riverctl background-color 0x000000
    riverctl border-color-focused 0x757581
    riverctl border-color-unfocused 0x2a2a2d
    riverctl focus-follows-cursor always
    riverctl set-cursor-warp on-focus-change
    riverctl rule-add -app-id 'float' float

    # Server-side decorations
    riverctl rule-add ssd

    # Keyboard repeat rate
    riverctl set-repeat 50 300

    ## Issue Patching ##
    dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP=river
  '';
}
