{ pkgs, ... }: {
  home = {
    packages = with pkgs; [
      # NOTE: unmodified graphical apps
      brave
      wezterm

      # NOTE: graphical cli tools
      aubio
      bibata-cursors
      ddcutil
      hyprland-qtutils # needed for banners and ANR messages
      hyprpolkitagent
      libcava
      libqalculate
      lm-sensors
      material-symbols
      thunar
      thunar-volman
      thunar-archive-plugin
    ];

    file = {
      ".config/wezterm/wezterm.lua".source = ../../gui/wezterm.lua;
      "Pictures/Wallpapers" = {
        source = ../../../media/wallpapers;
        recursive = true;
      };
    };

    sessionVariables = {
      EDITOR = "nvim";
      TERMINAL = "wezterm";
      XDG_TERMINAL_EMULATOR = "wezterm";
      XCURSOR_THEME = "Bibata-Modern-Ice";
      XCURSOR_SIZE = "24";
      GTK_THEME = "Adwaita-dark";
    };
  };

  services = {
    cliphist = {
      enable = true;
      allowImages = true;
    };
  };
}
