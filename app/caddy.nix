{
  config,
  gitEmail,
  pkgs,
  lib,
  ...
}:
{
  services.caddy = {
    enable = true;
    email = gitEmail;
    package = pkgs.caddy.withPlugins {
      plugins = [
        "github.com/caddy-dns/cloudflare@v0.2.2"
      ];

      hash = lib.fakeHash;
    };

    environmentFile = config.sops.secrets.CF_API_TOKEN.path;
    globalConfig = ''
      tls {
        dns cloudflare {env.CF_API_TOKEN}
        resolvers 1.1.1.1
      }
    '';

    virtualHosts."technitium.megaport.cc" = {
      extraConfig = ''
        reverse_proxy 127.0.0.1:5380
      '';
    };
  };
}
