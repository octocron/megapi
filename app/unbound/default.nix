_: {
  services.unbound = {
    enable = true;
    checkconf = false;
    settings = {
      auth-zone = [
        {
          name = "megaport.cc.";
          zonefile = "${./megaport.zone}";
          fallback-enabled = false;
        }
        {
          name = "0.99.10.in-addr.arpa.";
          zonefile = "${./reverse.zone}";
          fallback-enabled = false;
        }
      ];

      forward-zone = [
        {
          name = ''"."'';
          forward-tls-upstream = true;
          forward-addr = [
            "1.1.1.1@853#cloudflare-dns.com"
            "1.0.0.1@853#cloudflare-dns.com"
          ];
        }
      ];

      remote-control = {
        control-enable = true;
        control-port = 8953;
        control-interface = "127.0.0.1";
      };

      server = {
        access-control = [
          "127.0.0.0/8 allow"
          "10.99.0.0/16 allow"
          "192.168.1.0/24 allow"
          "192.168.10.0/24 allow"
          "10.0.81.0/24 allow"
        ];

        private-address = [
          "192.168.0.0/16"
          "169.254.0.0/16"
          "172.16.0.0/12"
          "127.0.0.0/8"
          "10.0.0.0/8"
        ];

        port = 53;
        cache-min-ttl = 3600;
        cache-max-ttl = 86400;
        serve-expired = true;
        serve-expired-ttl = 86400;
        msg-cache-size = "50m";
        rrset-cache-size = "100m";
        do-ip4 = true;
        do-ip6 = false;
        do-udp = true;
        do-tcp = true;
        prefetch = true;
        prefetch-key = true;
        harden-glue = true;
        aggressive-nsec = true;
        harden-dnssec-stripped = true;
        qname-minimisation = true;
        hide-identity = true;
        hide-version = true;
        use-syslog = true;
        log-queries = false;
        log-replies = false;
        so-reuseport = true;
        verbosity = 1;
        num-threads = 4;
      };
    };
  };
}
