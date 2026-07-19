_: {
  services.plex = {
    enable = true;
    openFirewall = true;
    group = "plex";
    user = "plex";
  };

  # SSD support
  fileSystems."/mnt/extssd" = {
    device = "/dev/disk/by-label/mnt/d";
    fsType = "exfat";
    options = [
      "defaults"
      "nofail"
      "x-systemd.automount"
      "x-systemd.device-timeout=5"
      "noauto"
      "x-systemd.after=network-online.target"
    ];
  };
}
