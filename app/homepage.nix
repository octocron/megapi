_: {
  homepage-dashboard = {
    enable = true;
    openFirewall = true;
    widgets = [
      {
        resources = {
          cpu = true;
          memory = true;
          disk = "/";
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
        "megaport" = [
          {
            "Unbound" = {
              description = "DNS Resolver";
              href = 10.99 .0 .37;
            };
          }
          {
            "Caddy" = {
              description = "Reverse Proxy";
              href = 10.99 .0 .37;
            };
          }
        ];
      }
    ];
  };
}
