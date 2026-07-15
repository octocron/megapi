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
      enable = false;
      iwd = {
        enable = true;
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
      "1.1.1.1"
      "1.0.0.1"
    ];

    firewall = {
      enable = true;
      allowedTCPPorts = [
      ];
      allowedUDPPorts = [
      ];

      interfaces.end0.allowedTCPPorts = [ 22 ];
    };
  };
}
