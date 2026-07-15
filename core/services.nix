_: {
  #-----------------------SERVICES-----------------------#
  services = {
    fail2ban.enable = true;
    fstrim.enable = true; # ssd optimizer
    printing.enable = false;
    timesyncd.enable = true;
    udev.enable = true;

    nix-serve = {
      enable = true;
      port = 5000;
      secretKeyFile = "/var/lib/nix-serve/cache-priv-key.pem";
    };

    openssh = {
      enable = true;
      ports = [ 22 ];
      settings = {
        PermitRootLogin = "no"; # prevent root from SSH login
        PasswordAuthentication = true; # users can SSH using username and password
        KbdInteractiveAuthentication = true; # allow keyboard based auth
      };
    };
  };
}
