# Hypr ecosystem config
{ ... }: {
  wayland.windowManager.hyprland = {
    settings = {
      # Auto-start
      exec-once = [
        "systemctl --user import-environment &"
        "hash dbus-update-activation-environment 2>/dev/null &"
        "dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP &"
        
        "wl-clip-persist --clipboard both &"
        "wl-paste --watch cliphist store &"
        "waybar &"
        "swww-daemon && swww img ~/Pictures/wallpapers/forest.jpg --transition-type none &"
        "swaync &" 
        "hypridle"
      ];

      # Input
      input = {
        kb_layout = "us";
        numlock_by_default = true;
        follow_mouse = 1;
        sensitivity = 0;
        touchpad = {
          natural_scroll = false;
        }; 
      };

      # General
      general = { 
        "$mainMod" = "SUPER";
        gaps_in = 5;
        gaps_out = 10;
        border_size = 2;
        "col.active_border" = "rgb(5BCEFA) rgb(F5A9B8) rgb(FFFFFF) rgb(F5A9B8) rgb(5BCEFA) 90deg"; # Trans Colors
        "col.inactive_border" = "rgba(595959aa)";
        resize_on_border = false;
        allow_tearing = false;
        layout = "dwindle";
      };

      dwindle = {
        pseudotile = true;
        preserve_split = true;
      };

      master = {
        new_status = "master";
      };

      decoration = {
        rounding = 4;
        active_opacity = 1.0;
        inactive_opacity = 1.0;
        # drop_shadow = true;
        # shadow_range = 4;
        # shadow_render_power = 3;
        # "col.shadow" = "rgba(1a1a1aee)";

        blur = {
          enabled = true;
          size = 3;
          passes = 1;
          vibrancy = 0.1696;
        };
      };

      animations = {
        enabled = true;
        bezier = [ "myBezier, 0.05, 0.9, 0.1, 1.05" ];
        animation = [
          # Windows
          "windows, 1, 7, myBezier"
          "windowsOut, 1, 7, default, popin 80%"
          
          # Fade
          "border, 1, 10, default"
          "borderangle, 1, 8, default"
          "fade, 1, 7, default"
          "workspaces, 1, 6, default"
        ];
      };

      # Miscellaneous
      misc = { 
        force_default_wallpaper = 0;
        disable_hyprland_logo = true;
        middle_click_paste = false;
      };

      # Keybinds
      bind = [
        "$mainMod, RETURN, exec, kitty"
        "$mainMod, C, killactive,"
        "$mainMod, M, exit,"
        "$mainMod, E, exec, nautilus"
        "$mainMod, V, togglefloating,"
        "$mainMod, SPACE, exec, wofi --show drun"
        "$mainMod, P, pseudo," # dwindle
        "$mainMod, J, togglesplit," # dwindle

        # Move focus with mainMod + arrow keys
        "$mainMod, left, movefocus, l"
        "$mainMod, right, movefocus, r"
        "$mainMod, up, movefocus, u"
        "$mainMod, down, movefocus, d"

        # Switch workspaces with mainMod + [0-9]
        "$mainMod, 1, workspace, 1"
        "$mainMod, 2, workspace, 2"
        "$mainMod, 3, workspace, 3"
        "$mainMod, 4, workspace, 4"
        "$mainMod, 5, workspace, 5"
        "$mainMod, 6, workspace, 6"
        "$mainMod, 7, workspace, 7"
        "$mainMod, 8, workspace, 8"
        "$mainMod, 9, workspace, 9"
        "$mainMod, 0, workspace, 10"

        # Move active window to a workspace with mainMod + SHIFT + [0-9]
        "$mainMod SHIFT, 1, movetoworkspace, 1"
        "$mainMod SHIFT, 2, movetoworkspace, 2"
        "$mainMod SHIFT, 3, movetoworkspace, 3"
        "$mainMod SHIFT, 4, movetoworkspace, 4"
        "$mainMod SHIFT, 5, movetoworkspace, 5"
        "$mainMod SHIFT, 6, movetoworkspace, 6"
        "$mainMod SHIFT, 7, movetoworkspace, 7"
        "$mainMod SHIFT, 8, movetoworkspace, 8"
        "$mainMod SHIFT, 9, movetoworkspace, 9"
        "$mainMod SHIFT, 0, movetoworkspace, 10"

        # Example special workspace (scratchpad)
        "$mainMod, S, togglespecialworkspace, magic"
        "$mainMod SHIFT, S, movetoworkspace, special:magic"

        # Scroll through existing workspaces with mainMod + scroll
        "$mainMod, mouse_down, workspace, e+1"
        "$mainMod SHIFT, RIGHT, workspace, e+1"
        "$mainMod, mouse_up, workspace, e-1"
        "$mainMod SHIFT, LEFT, workspace, e-1"

        # Screenshot
        "$mainMod, PRINT, exec, hyprshot -m window"
        ", PRINT, exec, hyprshot -m output"
        "$mainMod SHIFT, PRINT, exec, hyprshot -m region"
        
        # Notification center
        "$mainMod, N, exec, swaync-client -t -sw"
        
        # Media control
        ", XF86AudioPlay, exec, playerctl play-pause"
        ", XF86AudioPrev, exec, playerctl previous"
        ", XF86AudioNext, exec, playerctl next"

        # Clipboard manager
        "$mainMod, B, exec, cliphist list | wofi -dmenu -theme-str 'window {width: 50%;}' | cliphist decode | wl-copy"
      ];

      bindm = [
        # Move/resize windows with mainMod + LMB/RMB and dragging
        "$mainMod, mouse:272, movewindow"
        "$mainMod, mouse:273, resizewindow"
      ];

      # Windows and workspaces
      windowrulev2 = [
        "suppressevent maximize, class:.*" # You'll probably like this.
      ];
    };

    extraConfig = "
      monitor=,preferred,auto,auto

      xwayland {
        force_zero_scaling = true
      } 
    ";
  };
}
