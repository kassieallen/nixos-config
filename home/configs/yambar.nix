# Home-manager yambar configuration
{
  home.file.".config/yambar/config.yml".text = ''
    jbm: &jbm JetBrainsMono Nerd Font:pixelsize=14
    bg: &bg {stack: [{background: {color: 2a2a2de6}}, {underline: {size: 2, color: 757581ff}}]}

    bar:
      height: 25
      location: top
      font: *jbm
      spacing: 2
      margin: 0
      layer: bottom
      foreground: c9c7cdff
      background: 131314e6

      left:
        - river:
            anchors:
              - base: &river_base
                  left-margin: 10
                  right-margin: 10
                  default: {string: {text: "{id}", font: *jbm}}
                  conditions:
                    id == 16: {string: {text: "󱓧", font: *jbm}}

            content:
              map:
                on-click:
                  left: sh -c "riverctl set-focused-tags $((1 << ({id} - 1)))"
                  middle: sh -c "riverctl toggle-view-tags $((1 << ({id} - 1)))"
                  right: sh -c "riverctl toggle-focused-tags $((1 << ({id} - 1)))"
                conditions:
                  state == urgent:
                    map:
                      <<: *river_base
                      deco: {background: {color: ea83a5ff}}
                  state == focused:
                    map:
                      <<: *river_base
                      deco: *bg
                  state == visible && ~occupied:
                    map:
                      <<: *river_base
                  state == visible && occupied:
                    map: 
                      <<: *river_base
                      deco: *bg
                  state == unfocused:
                    map:
                      <<: *river_base
                  state == invisible && ~occupied: {empty: {}}
                  state == invisible && occupied:
                    map:
                      <<: *river_base
                      deco: {underline: {size: 2, color: 2a2a2dff}}
      center:
        - foreign-toplevel:
            content:
              map:
                conditions:
                  ~activated: {empty: {}}
                  activated:
                    - string: {text: "{app-id}", foreground: aca1cfff}
                    - string: {text: ": {title}"}
      right:
        - pulse:
            content:
              map:
                margin: 10 
                default: {empty: {}}
                conditions:
                  sink_online: {string: {text: "  {sink_percent}%"}}
        - network:
            poll-interval: 1000
            content:
              map:
                default: {empty: {}}
                on-click:
                  left: sh -c "foot --app-id=float -e nmtui"
                conditions:
                  name == wlo1:
                    map:
                      default: {string: {text: "󰖩 ", font: *jbm, foreground: ffffff66, right-margin: 10}}
                      conditions:
                        state == down: {string: {text: " ", font: *jbm, foreground: ff0000ff, right-margin: 10}}
                        state == up:
                          map:
                            default:
                              - string: {text: "󰖩", font: *jbm}
                              - string: {text: " {dl-speed:mb}/{ul-speed:mb} Mb/s", right-margin: 10}

                            conditions:
                              ipv4 == "":
                                - string: {text: "󰖩 ", font: *jbm, foreground: ffffff66}
                                - string: {text: " {dl-speed:mb}/{ul-speed:mb} Mb/s", foreground: ffffff66, right-margin: 10}
        - clock:
            time-format: "%I:%M %p"
            content:
              - string: {text: "{date} {time}", right-margin: 6}
  '';
}
