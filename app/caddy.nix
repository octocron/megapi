{ gitEmail, ... }:
{
  services.caddy = {
    enable = true;
    email = gitEmail;
    extraConfig = ''
      acme_dns megaport.cc {
      host 10.99.0.37
      }
    '';
  };
}
