# INFO: Create a CA: nebula-cert ca -name "megaport" -duration 2400d -out-dir /etc/nebula
# TODO: sudo chmod --reference /etc/nix /etc/nebula
# TODO: sudo chmod --reference /etc/nix/nix.conf /etc/nebula/*
{ hostname, ... }:
{
  services.nebula.networks.megaport = {
    enable = true;
    isLighthouse = true;
    ca = "/etc/nebula/ca.crt";
    cert = "/etc/nebula/${hostname}.crt"; # lighthouse would be called hostname
    key = "/etc/nebula/${hostname}.key"; # <- sensitive!

    listen = {
      host = "0.0.0.0";
      port = 4242;
    };

    staticHostMap = { };

    settings = {
      punchy = {
        punch = true;
        respond = true;
        delay = "1s";
      };

      relay = {
        am_relay = false;
        use_relay = false;
      };
    };

    # INFO: firewall is default deny.  There is no way to write a deny rule!
    firewall = {
      # NOTE: Allow traffic TO this node
      inbound = [
        {
          # Allow icmp between any nebula hosts
          port = "any";
          proto = "icmp";
          host = "any";
        }
        {
          # Allow ssh from admins
          port = 22;
          proto = "tcp";
          groups = [ "admin" ];
        }
        {
          # Allow DNS
          port = 53;
          proto = "tcp";
          host = "any";
        }
        {
          # Allow DNS
          port = 53;
          proto = "udp";
          host = "any";
        }
        {
          # Allow HTTPS
          port = 443;
          proto = "tcp";
          host = "any";
        }
        {
          # Allow DNS over TLS
          port = 853;
          proto = "tcp";
          host = "any";
        }
        {
          # Allow homepage
          port = 8082;
          proto = "tcp";
          groups = [ "admin" ];
        }
      ];

      # NOTE: Allow traffic FROM this node
      outbound = [
        {
          port = "any";
          proto = "any";
          host = "any";
        }
      ];
    };
  };
}
