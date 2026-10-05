{
  config,
  username,
  ...
}:
{
  systemd.tmpfiles.rules = [
    "d /var/lib/homelable 0750 root root -"
    "d /var/lib/homelable/uploads 0750 root root -"
  ];

  sops = {
    secrets = {
      "homelable-secret-key" = { };
      "homelable-password-hash" = { };
    };
    templates."homelable-env" = {
      content = ''
        SECRET_KEY=${config.sops.placeholder."homelable-secret-key"}
        AUTH_USERNAME=${username}
        AUTH_PASSWORD_HASH='${config.sops.placeholder."homelable-password-hash"}'
      '';
    };
  };

  virtualisation = {
    oci-containers = {
      backend = "podman";
      containers = {
        homelable-backend = {
          autoStart = true;
          image = "ghcr.io/pouzor/homelable-backend:3.5.1";
          environment = {
            SQLITE_PATH = "/app/data/homelab.db";
            UPLOAD_DIR = "/app/data/uploads";
            CORS_ORIGINS = ''["http://127.0.0.1:8480","http://localhost:8480"]'';
            SCANNER_RANGES = ''["192.168.10.0/24"]'';
            STATUS_CHECKER_INTERVAL = "60";
          };
          volumes = [
            "/var/lib/homelable:/app/data"
          ];
          environmentFiles = [
            config.sops.templates."homelable-env".path
          ];
          extraOptions = [
            "--network=host"
            "--cap-add=NET_RAW"
            "--cap-add=NET_ADMIN"
          ];
          cmd = [
            "uvicorn"
            "app.main:app"
            "--host"
            "0.0.0.0"
            "--port"
            "8481"
          ];
        };

        homelable-frontend = {
          autoStart = true;
          image = "ghcr.io/pouzor/homelable-frontend:3.5.1";
          dependsOn = [ "homelable-backend" ];
          environment = {
            BACKEND_UPSTREAM = "host.docker.internal:8481";
          };
          ports = [
            "127.0.0.1:8480:80"
          ];
          extraOptions = [
            "--add-host=host.docker.internal:host-gateway"
          ];
        };
      };
    };
  };

  systemd.services.podman-homelable-backend = {
    after = [ "sops-install-secrets.service" ];
    wants = [ "sops-install-secrets.service" ];
  };
}
