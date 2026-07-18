_: {
  services.unbound = {
    enable = true;
    checkconf = true;
    settings = {
      auth-zone = [
        {
          name = "megaport.cc.";
          type = "static";
          fallback = "no";
          # ++ serial # after hostmaster if any changes are made in data list
          data = [
            "megaport.cc. IN SOA primus.megaport.cc. hostmaster.megaport.cc. 2026071801 7200 3600 1209600 3600"
            "megaport.cc. 3600 IN NS primus.megaport.cc."
            "primus.megaport.cc. 3600 IN A 10.99.0.37"
            "*.megaport.cc. 3600 IN A 192.168.1.37"
            "homepage.megaport.cc. 3600 IN A 10.99.0.37"
          ];
        }
      ];

      server = {
        username = ''""'';
        verbosity = 3;
        interface = [
          "127.0.0.1"
          "10.99.0.37"
          "192.168.1.37"
        ];
        port = 53;
        do-ip4 = "yes";
        do-ip6 = "no";
        do-udp = "yes";
        do-tcp = "yes";
        do-not-query-localhost = "yes";
        access-control = [
          "127.0.0.0/8 allow"
          "10.99.0.0/16 allow"
          "192.168.1.0/24 allow"
          "10.0.81.0/24 allow"
        ];
        cache-min-ttl = 3600;
        cache-max-ttl = 86400;
        msg-cache-size = "50m";
        rrset-cache-size = "100m";
        prefetch = "yes";
        hide-identity = "yes";
        hide-version = "yes";
        use-syslog = "yes";
        log-queries = "yes";
        log-replies = "yes";
      };

      forward-zone = {
        name = ''"."'';
        forward-first = "yes";
        forward-addr = [
          "1.1.1.1@853#cloudflare-dns.com"
          "1.0.0.1@853#cloudflare-dns.com"
        ];
      };

      remote-control.control-enable = true;
    };
  };
}
