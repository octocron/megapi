_: {
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
        datetime = {
          format = "iso";
        };
      }
    ];
  };
}
