{
  config,
  hostname,
  ...
}:
{
  #-----------------NETWORKING------------------------#
  networking = {
    hostName = hostname; # INFO: Defines hostname
    nftables.enable = true;

    networkmanager = {
      enable = true;
      ensureProfiles = {
        profiles = {
          multiplex = {
            connection = {
              autoconnect = true;
              id = "Multiplex";
              type = "wifi";
            };
            ipv4 = {
              method = "auto";
              ignore-auto-dns = true;
            };
            wifi = {
              mode = "infrastructure";
              ssid = "Multiplex";
            };
            wifi-security = {
              key-mgmt = "wpa-psk";
            };
          };

          FBIvan009 = {
            connection = {
              autoconnect = true;
              id = "FBIvan009";
              type = "wifi";
            };
            ipv4 = {
              method = "auto";
              ignore-auto-dns = true;
            };
            wifi = {
              mode = "infrastructure";
              ssid = "FBIvan009";
            };
            wifi-security = {
              key-mgmt = "wpa-psk";
            };
          };
        };

        secrets.entries = [
          {
            matchId = "Multiplex";
            matchType = "wifi";
            matchSetting = "wifi-security";
            key = "psk";
            file = config.sops.secrets.passwordMultiplex.path;
          }
          {
            matchId = "FBIvan009";
            matchType = "wifi";
            matchSetting = "wifi-security";
            key = "psk";
            file = config.sops.secrets.passwordFBIvan009.path;
          }
        ];
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
