#----------MOD---------------------------------------->>
{ lib, ... }:
let
  lua = lib.generators.mkLuaInline;

  bind = key: action: {
    _args = [
      key
      (lua action)
    ];
  };

  exec = cmd: ''hl.dsp.exec_cmd("${cmd}")'';
in
{
  wayland.windowManager.hyprland.settings = {
    bind = [
      #----------apps / core---------------------------------------->>
      (bind "SUPER + Return" (exec "uwsm app -- wezterm"))
      (bind "SUPER + SHIFT + Return" ''hl.dsp.global("caelestia:launcher")'')
      (bind "SUPER + B" (exec "uwsm app -- brave"))
      (bind "SUPER + C" (exec "hyprpicker -a"))
      (bind "SUPER + F" "hl.dsp.window.fullscreen()")
      (bind "SUPER + P" (exec "uwsm app -- plex-desktop"))
      (bind "SUPER + Q" "hl.dsp.window.close()")
      (bind "SUPER + S" (exec "uwsm app -- signal-desktop"))
      (bind "SUPER + T" (exec "uwsm app -- thunar"))
      (bind "SUPER + W" (exec "uwsm app -- wezterm"))
      (bind "SUPER + Y" (exec "uwsm app -- kitty -e yazi"))

      #----------SUPER / SHIFT---------------------------------------->>
      (bind "SUPER + SHIFT + C" "hl.dsp.exit()")
      (bind "SUPER + SHIFT + F" ''hl.dsp.window.float({ action = "toggle" })'')
      (bind "SUPER + SHIFT + K" (exec "uwsm app -- kitty"))
      (bind "SUPER + SHIFT + M" (exec "uwsm app -- mullvad-vpn"))
      (bind "SUPER + SHIFT + P" (exec "uwsm app -- plexamp"))
      (bind "SUPER + SHIFT + left" ''hl.dsp.window.move({ direction = "l" })'')
      (bind "SUPER + SHIFT + right" ''hl.dsp.window.move({ direction = "r" })'')
      (bind "SUPER + SHIFT + up" ''hl.dsp.window.move({ direction = "u" })'')
      (bind "SUPER + SHIFT + down" ''hl.dsp.window.move({ direction = "d" })'')
      (bind "SUPER + SHIFT + h" ''hl.dsp.window.move({ direction = "l" })'')
      (bind "SUPER + SHIFT + l" ''hl.dsp.window.move({ direction = "r" })'')
      (bind "SUPER + SHIFT + k" ''hl.dsp.window.move({ direction = "u" })'')
      (bind "SUPER + SHIFT + j" ''hl.dsp.window.move({ direction = "d" })'')

      #----------SUPER / ALT------------------------------------------>>
      (bind "SUPER + ALT + D" ''hl.dsp.dispatch("pseudo")'')
      (bind "SUPER + ALT + P" (exec "pwvucontrol"))
      (bind "SUPER + ALT + F" ''hl.dsp.dispatch("workspaceopt", "allfloat")'')
      (bind "SUPER + ALT + left" ''hl.dsp.dispatch("swapwindow", "l")'')
      (bind "SUPER + ALT + right" ''hl.dsp.dispatch("swapwindow", "r")'')
      (bind "SUPER + ALT + up" ''hl.dsp.dispatch("swapwindow", "u")'')
      (bind "SUPER + ALT + down" ''hl.dsp.dispatch("swapwindow", "d")'')
      (bind "SUPER + ALT + 43" ''hl.dsp.dispatch("swapwindow", "l")'')
      (bind "SUPER + ALT + 46" ''hl.dsp.dispatch("swapwindow", "r")'')
      (bind "SUPER + ALT + 45" ''hl.dsp.dispatch("swapwindow", "u")'')
      (bind "SUPER + ALT + 44" ''hl.dsp.dispatch("swapwindow", "d")'')

      #----------focus / workspaces------------------------------------------>>
      (bind "SUPER + left" ''hl.dsp.focus({ direction = "l" })'')
      (bind "SUPER + right" ''hl.dsp.focus({ direction = "r" })'')
      (bind "SUPER + up" ''hl.dsp.focus({ direction = "u" })'')
      (bind "SUPER + down" ''hl.dsp.focus({ direction = "d" })'')
      (bind "SUPER + h" ''hl.dsp.focus({ direction = "l" })'')
      (bind "SUPER + l" ''hl.dsp.focus({ direction = "r" })'')
      (bind "SUPER + k" ''hl.dsp.focus({ direction = "u" })'')
      (bind "SUPER + j" ''hl.dsp.focus({ direction = "d" })'')

      (bind "SUPER + 1" ''hl.dsp.dispatch("workspace", "1")'')
      (bind "SUPER + 2" ''hl.dsp.dispatch("workspace", "2")'')
      (bind "SUPER + 3" ''hl.dsp.dispatch("workspace", "3")'')
      (bind "SUPER + 4" ''hl.dsp.dispatch("workspace", "4")'')
      (bind "SUPER + 5" ''hl.dsp.dispatch("workspace", "5")'')
      (bind "SUPER + 6" ''hl.dsp.dispatch("workspace", "6")'')
      (bind "SUPER + 7" ''hl.dsp.dispatch("workspace", "7")'')
      (bind "SUPER + 8" ''hl.dsp.dispatch("workspace", "8")'')
      (bind "SUPER + 9" ''hl.dsp.dispatch("workspace", "9")'')
      (bind "SUPER + 0" ''hl.dsp.dispatch("workspace", "10")'')

      (bind "SUPER + SHIFT + SPACE" ''hl.dsp.dispatch("movetoworkspace", "special")'')
      (bind "SUPER + SPACE" ''hl.dsp.dispatch("togglespecialworkspace")'')

      (bind "SUPER + SHIFT + 1" ''hl.dsp.dispatch("movetoworkspace", "1")'')
      (bind "SUPER + SHIFT + 2" ''hl.dsp.dispatch("movetoworkspace", "2")'')
      (bind "SUPER + SHIFT + 3" ''hl.dsp.dispatch("movetoworkspace", "3")'')
      (bind "SUPER + SHIFT + 4" ''hl.dsp.dispatch("movetoworkspace", "4")'')
      (bind "SUPER + SHIFT + 5" ''hl.dsp.dispatch("movetoworkspace", "5")'')
      (bind "SUPER + SHIFT + 6" ''hl.dsp.dispatch("movetoworkspace", "6")'')
      (bind "SUPER + SHIFT + 7" ''hl.dsp.dispatch("movetoworkspace", "7")'')
      (bind "SUPER + SHIFT + 8" ''hl.dsp.dispatch("movetoworkspace", "8")'')
      (bind "SUPER + SHIFT + 9" ''hl.dsp.dispatch("movetoworkspace", "9")'')
      (bind "SUPER + SHIFT + 0" ''hl.dsp.dispatch("movetoworkspace", "10")'')

      (bind "SUPER + CONTROL + right" ''hl.dsp.dispatch("workspace", "e+1")'')
      (bind "SUPER + CONTROL + left" ''hl.dsp.dispatch("workspace", "e-1")'')
      (bind "SUPER + mouse_down" ''hl.dsp.dispatch("workspace", "e+1")'')
      (bind "SUPER + mouse_up" ''hl.dsp.dispatch("workspace", "e-1")'')

      (bind "ALT + Tab" ''hl.dsp.dispatch("cyclenext")'')
      (bind "ALT + Tab" ''hl.dsp.dispatch("bringactivetotop")'')
      (bind "ALT + SPACE" ''hl.dsp.global("caelestia:launcher")'')

      #----------media / brightness------------------------------------------>>
      (bind "XF86AudioRaiseVolume" (exec "wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+"))
      (bind "XF86AudioLowerVolume" (exec "wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"))
      (bind "XF86AudioMute" (exec "wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"))
      (bind "XF86AudioPlay" (exec "playerctl play-pause"))
      (bind "XF86AudioPause" (exec "playerctl play-pause"))
      (bind "XF86AudioNext" (exec "playerctl next"))
      (bind "XF86AudioPrev" (exec "playerctl previous"))
      (bind "XF86MonBrightnessDown" (exec "brightnessctl set 5%-"))
      (bind "XF86MonBrightnessUp" (exec "brightnessctl set +5%"))
    ];

    bindm = [
      (bind "SUPER + mouse:272" "hl.dsp.window.drag()")
      (bind "SUPER + mouse:273" "hl.dsp.window.resize()")
    ];
  };
}
