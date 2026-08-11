{
  wayland.windowManager.hyprland.settings.env = [
    {
      _args = [
        "XDG_CURRENT_DESKTOP"
        "Hyprland"
      ];
    }
    {
      _args = [
        "XDG_SESSION_DESKTOP"
        "Hyprland"
      ];
    }
    {
      _args = [
        "CLUTTER_BACKEND"
        "wayland"
      ];
    }
    {
      _args = [
        "QT_WAYLAND_DISABLE_WINDOWDECORATION"
        "1"
      ];
    }
    {
      _args = [
        "QT_AUTO_SCREEN_SCALE_FACTOR"
        "1"
      ];
    }
    {
      _args = [
        "GDK_SCALE"
        "1"
      ];
    }
    {
      _args = [
        "QT_SCALE_FACTOR"
        "1"
      ];
    }
  ];
}
