_: {
  services.homepage-dashboard = {
    enable = true;
    openFirewall = true;
    theme = "dark";
    iconStyle = "theme";
    language = "en";
    allowedHosts = "homepage.megaport.cc,localhost:8082,127.0.0.1:8082";
    #background = "";
    title = "Another wall of joy!";

    widgets = [
      {
        resources = {
          cpu = true;
          memory = true;
          disk = "/";
        };
      }
      {
        search = {
          provider = "duckduckgo";
          target = "_blank";
        };
      }
      {
        datetime = {
          format = "iso";
        };
      }
    ];

    services = [
      {
        "Media" = [
          {
            "Plex" = {
              description = "DNS manager";
              #href = "https://plex.megaport.cc";
            };
          }
        ];
        "Services" = [
          {
            "AdGuard Home" = {
              description = "DNS manager";
              #href = "https://adguard.megaport.cc";
            };
          }
        ];
      }
    ];

    layout = {
      Media = {
        style = "row";
        columns = 4;
      };

      Services = {
        style = "row";
        columns = 4;
      };
    };
  };
}
