{ pkgs, ... }:
# NOTE: http://localhost:5380
{
  environment.systemPackages = with pkgs; [
    technitium-dns-server
  ];

  services.technitium-dns-server = {
    enable = true;
    # INFO: ports 53 5380 53443
    openFirewall = true;
  };
}
