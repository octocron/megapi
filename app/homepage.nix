{
  services.homepage-dashboard = {
    enable = true;
    openFirewall = true;
    allowedHosts = "homepage.megaport.cc,localhost:8082,127.0.0.1:8082";

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

    bookmarks = [
      {
        Repos = [
          {
            Github = [
              {
                abbr = "GH";
                href = "https://github.com/octocron";
              }
              {
                abbr = "GL";
                href = "https://gitlab.com/megacron";
              }
            ];
          }
        ];
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
            "Satisfactory" = {
              description = "Satisfactory - Let's Fixit";
              href = "https://sf.megaport.cc";
            };
          }
        ];
      }
    ];
  };
}
