# Hyprlock config
{ pkgs, ... }:
let 
  text = "rgb(251, 241, 199)";
in
{
  home.packages = [ pkgs.hyprlock ];
  xdg.configFile."hypr/hyprlock.conf".text = ''
    # GENERAL
    general {
      hide_cursor = true
      disable_loading_bar = true
    }

    # BACKGROUND
    background {
      monitor = 
      path = ~/Pictures/wallpapers/forest.jpg
      color = rgba(25, 20, 20, 1.0)

      blur_passes = 2 # 0 disables blurring
      blur_size = 1
      noise = 0.0117
      contrast = 0.8916
      brightness = 0.8172
      vibrancy = 0.1696
      vibrancy_darkness = 0.0
    }

    # INPUT
    input-field {
      monitor =
      size = 200, 50
      outline_thickness = 2
      dots_size = 0.25
      dots_spacing = 0.25
      dots_center = false
      dots_rounding = -1
      dots_fade_time = 200
      dots_text_format =
      outer_color = rgb(27, 27, 29)
      inner_color = rgb(19, 19, 20)
      font_color = rgb(201, 199, 205)
      font_family = JetBrainsMono Nerd Font
      fade_on_empty = true
      fade_timeout = 1500
      placeholder_text =
      hide_input = false
      rounding = 8
      check_color = rgb(204, 136, 34)
      fail_color = rgb(234, 131, 165)
      fail_text = <i>$FAIL <b>($ATTEMPTS)</b></i>
      fail_timeout = 2000
      fail_transition = 300
      capslock_color = -1
      numlock_color = -1
      bothlock_color = -1
      invert_numlock = false
      swap_font_color = false

      position = 0, -20
      halign = center
      valign = center
    }

    # DATE
    label {
      monitor =
      text = cmd[update:1000] echo "$(date +"%A, %B %d")"
      color = rgba(242, 243, 244, 0.75)
      font_size = 22
      font_family = JetBrains Mono
      position = 0, 300
      halign = center
      valign = center
    }

    # TIME
    label {
      monitor = 
      text = cmd[update:1000] echo "$(date +"%-H:%M")"
      color = rgba(242, 243, 244, 0.75)
      font_size = 95
      font_family = JetBrainsMono
      position = 0, 200
      halign = center
      valign = center
    }

    # PROFILE PICTURE
    image {
      monitor =
      path = ~/Pictures/kassie.png
      size = 100
      border_size = 2
      border_color = rgb(27, 27, 29)
      position = 0, 75
      halign = center
      valign = center
    } 
  '';
  }
