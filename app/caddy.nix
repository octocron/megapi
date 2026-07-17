{
  config,
  gitEmail,
  pkgs,
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

      hash = "sha256-qEA6058svI8Q6yE97OkfnGWC8ayI3x8y2iU7PGkJ3Do=";
    };

    environmentFile = config.sops.secrets.CF_API_TOKEN.path;
    globalConfig = ''
      acme_dns {
        dns cloudflare {env.CF_API_TOKEN}
        resolvers 1.1.1.1
      }
    '';

    virtualHosts = {
      "*.megaport.cc" = {
        extraConfig = ''
          tls {
            dns cloudflare {
              env CF_API_TOKEN
            }
          }
        '';
      };

      "technitium.megaport.cc" = {
        extraConfig = ''
          reverse_proxy 127.0.0.1:5380
        '';
      };
    };
  };
}
