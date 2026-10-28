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
      ensureProfiles.profiles = {
        multiplex = {
          connection = {
            id = "Multiplex";
            type = "wifi";
          };
          ipv4 = {
            method = "auto";
            ignore-auto-dns = true;
          };
          wireless = {
            ssid = "Multiplex";
            mode = "infrastructure";
          };
          wireless-security = {
            key-mgmt = "wpa-psk";
            psk = config.sops.secrets.passwordMultiplex.path;
          };
        };

        FBIvan009 = {
          connection = {
            id = "FBIvan009";
            type = "wifi";
          };
          ipv4 = {
            method = "auto";
            ignore-auto-dns = true;
          };
          wireless = {
            ssid = "FBIvan009";
            mode = "infrastructure";
          };
          wireless-security = {
            key-mgmt = "wpa-psk";
            psk = config.sops.secrets.passwordFBIvan009.path;
          };
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
