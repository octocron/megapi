{
  hostname,
  lib,
  ...
}:
{
  #-----------------NETWORKING------------------------#
  networking = {
    hostName = "${hostname}"; # Defines hostname.
    networkmanager.enable = true;
    nftables.enable = true;
    wireless.enable = lib.mkForce false;

    nameservers = [
      "1.1.1.1"
      "1.0.0.1"
    ];

    firewall = {
      enable = true;
      allowedTCPPorts = [
        22
      ];
      allowedUDPPorts = [
      ];
    };
  };
}
