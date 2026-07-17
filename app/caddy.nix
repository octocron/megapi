{ gitEmail, ... }:
{
  services.caddy = {
    enable = true;
    email = gitEmail;
    virtualHosts."dns.megaport.cc" = {
      extraConfig = ''
        bind 10.99.0.37
        reverse_proxy 127.0.0.1:5380
      '';
    };
  };
}
