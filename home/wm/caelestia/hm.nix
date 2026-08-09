{ pkgs, ... }: {
  home = {
    packages = with pkgs; [
      # NOTE: unmodified graphical apps
      brave
      discord

      # NOTE: graphical cli tools
      thunar
      thunar-volman
      thunar-archive-plugin
    ];

    file = {
      ".config/wezterm/wezterm.lua".source = ../../gui/wezterm.lua;
      "wallpapers" = {
        source = ../../../media/wallpapers;
        recursive = true;
      };
    };
  };

  services = {
    cliphist = {
      enable = true;
      allowImages = true;
    };
  };
}
