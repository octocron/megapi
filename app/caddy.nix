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

      hash = "sha256-8yZDrejNKsaUnUaTUFYbarWNmxafqp2z2rWo+XRsxV8=";
    };

    environmentFile = config.sops.templates."caddy-env".path;

    globalConfig = ''
      acme_dns cloudflare {env.CLOUDFLARE_API_TOKEN}
      resolvers 1.1.1.1
    '';

    virtualHosts = {
      "*.megaport.cc" = {
        extraConfig = ''
          tls {
            dns cloudflare
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
