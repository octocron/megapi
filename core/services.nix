_: {
  #-----------------------SERVICES-----------------------#
  services = {
    fail2ban.enable = true;
    fstrim.enable = true; # ssd optimizer
    printing.enable = false;
    timesyncd.enable = true;
    udev.enable = true;

    openssh = {
      enable = true;
      ports = [ 22 ];
      settings = {
        PermitRootLogin = "no"; # prevent root from SSH login
        PasswordAuthentication = false; # users can SSH using username and password
        KbdInteractiveAuthentication = true; # allow keyboard based auth
      };
    };
  };
}
