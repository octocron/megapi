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
      "9.9.9.9"
      "149.112.112.112"
    ];

    firewall = {
      enable = true;
      allowedTCPPorts = [
      ];
      allowedUDPPorts = [
        4242 # lighthouse
      ];

      interfaces.end0.allowedTCPPorts = [
        22 # ssh
        5000 # nix-serve
      ];

      trustedInterfaces = [
        "nebula.megaport"
      ];
    };
  };
}
