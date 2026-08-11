{ lib, ... }:
let
  lua = lib.generators.mkLuaInline;
in
{
  wayland.windowManager.hyprland = {
    enable = true;
    configType = "lua";
    systemd.enable = false;
    xwayland.enable = true;
    settings = {
      monitor = {
        output = "";
        mode = "preferred";
        position = "auto";
        scale = 1;
      };

      on = {
        _args = [
          "hyprland.start"
          (lua ''
            function()
              hl.exec_cmd("gsettings set org.gnome.desktop.interface gtk-theme 'Adwaita-dark'")
              hl.exec_cmd("gsettings set org.gnome.desktop.interface color-scheme 'prefer-dark'")
              hl.exec_cmd("dbus-update-activation-environment --all --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP QT_QPA_PLATFORMTHEME")
              hl.exec_cmd("systemctl --user import-environment WAYLAND_DISPLAY XDG_CURRENT_DESKTOP")
              hl.exec_cmd("systemctl --user start hyprpolkitagent")
              hl.exec_cmd("caelestia-shell -d")
            end
          '')
        ];
      };

      config = {
        input = {
          kb_layout = "us";
          kb_options = "grp:alt_caps_toggle,caps:super";
          numlock_by_default = true;
          repeat_delay = 300;
          follow_mouse = 1;
          float_switch_override_focus = false;
          sensitivity = 0;
        };

        general = {
          layout = "dwindle";
          gaps_in = 4;
          gaps_out = 8;
          border_size = 3;
          resize_on_border = true;
          "col.active_border" = {
            colors = [
              "rgba(ee4400ff)"
              "rgba(228800ff)"
            ];
            angle = 45;
          };
          "col.inactive_border" = {
            colors = [
              "rgba(0066cccc)"
              "rgba(880022cc)"
            ];
            angle = 45;
          };
        };

        misc = {
          layers_hog_keyboard_focus = true;
          initial_workspace_tracking = false;
          mouse_move_enables_dpms = true;
          key_press_enables_dpms = false;
          disable_hyprland_logo = true;
          disable_splash_rendering = true;
          enable_swallow = false;
          vrr = true;

          #  Application not responding (ANR) settings
          enable_anr_dialog = true;
          anr_missed_pings = 20;
        };

        dwindle = {
          preserve_split = true;
          force_split = 2;
        };

        decoration = {
          rounding = 10;
          blur = {
            enabled = true;
            size = 5;
            passes = 3;
            ignore_opacity = false;
            xray = true;
          };
          shadow = {
            enabled = true;
            range = 4;
            render_power = 3;
            color = "rgba(1a1a1aee)";
          };
        };

        ecosystem = {
          no_donation_nag = true;
          no_update_news = false;
        };

        cursor = {
          sync_gsettings_theme = true;
          no_hardware_cursors = false;
          enable_hyprcursor = false;
          warp_on_change_workspace = false;
          no_warps = true;
        };

        master = {
          new_status = "master";
          new_on_top = 1;
          mfact = 0.5;
        };
      };
    };
  };
}
