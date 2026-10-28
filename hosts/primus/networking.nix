{
  hostname,
  lib,
  ...
}:
{
  #-----------------NETWORKING------------------------#
  networking = {
    hostName = hostname;
    useNetworkd = true;
    nftables.enable = true;

    wireless = {
      iwd = {
        enable = false;
        settings = {
          Network = {
            EnableIPv6 = true;
            RoutePriorityOffset = 300;
          };
          Settings.AutoConnect = true;
        };
      };
    };

    nameservers = lib.mkDefault [
      "127.0.0.1"
    ];

    firewall = {
      enable = true;
      allowedTCPPorts = [
        53 # dns
        80 # http
        443 # https
      ];
      allowedUDPPorts = [
        53 # dns
        80 # http
        443 # https
        4242 # lighthouse
      ];

      interfaces.end0.allowedTCPPorts = [
        22 # ssh
      ];

      trustedInterfaces = [
        "nebula.megaport"
      ];
    };
  };
}
