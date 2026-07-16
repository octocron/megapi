{ pkgs, ... }:
# NOTE: http://localhost:5380
{
  services.technitium-dns-server = {
    enable = true;
    # INFO: ports 53 5380 53443
    openFirewall = true;
  };

  systemd.services.technitium-dns-server.serviceConfig.ReadWritePaths = [ "/var/log/technitium/dns" ];
}
