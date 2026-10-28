{
  config,
  hostname,
  ...
}:
{
  #-----------------NETWORKING------------------------#
  networking = {
    hostName = hostname; # INFO: Defines hostname
    networkmanager.enable = true;
    nftables.enable = true;

    wireless = {
      iwd = {
        enable = true;
        settings = {
          Network = {
            EnableIPv6 = true;
            RoutePriorityOffset = 300;
            "Multiplex" = {
              psk = config.sops.secrets.passwordMultiplex.path;
            };
            "FBIvan009" = {
              psk = config.sops.secrets.passwordFBIvan009.path;
            };
          };
          Settings.AutoConnect = true;
        };
      };
    };

    firewall = {
      enable = true;
      allowedTCPPorts = [
      ];
      allowedUDPPorts = [
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
