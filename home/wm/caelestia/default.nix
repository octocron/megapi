{
  programs.caelestia = {
    enable = true;

    systemd = {
      enable = false; # if you prefer starting from your compositor
      target = "graphical-session.target";
      environment = [ ];
    };

    settings = {
      bar.statusIcons = [
        {
          id = "lockStatus";
          enabled = true;
        }
        {
          id = "network";
          enabled = true;
        }
        {
          id = "bluetooth";
          enabled = true;
        }
        {
          id = "battery";
          enabled = false;
        }
      ];
      paths.wallpaperDir = "~/wallpapers";
    };

    cli = {
      enable = true; # Also add caelestia-cli to path
      settings = {
        theme.enableGtk = false;
      };
    };

    home.file = {
      "wallpapers" = {
        source = ./media/wallpapers;
        recursive = true;
      };
    };
  };
}
