_: {
  services.homepage-dashboard = {
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
  };
}
