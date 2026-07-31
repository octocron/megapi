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
        "github.com/caddy-dns/cloudflare@v0.2.4"
      ];

      hash = "sha256-bzMqxWTqrJ1skZmRTXyEMCKStXpljbqe5r0Ve2cnBfM=";
    };

    environmentFile = config.sops.templates."caddy-env".path;

    globalConfig = ''
      acme_dns cloudflare {env.CLOUDFLARE_API_TOKEN}
    '';

    virtualHosts = {
      "*.megaport.cc" = {
        extraConfig = ''
          tls {
            dns cloudflare {
              api_token {env.CLOUDFLARE_API_TOKEN}
            }
          }
        '';
      };

      "homepage.megaport.cc" = {
        extraConfig = ''
          reverse_proxy 127.0.0.1:8082
        '';
      };
    };
  };
}
