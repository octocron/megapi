{ pkgs, ... }: {
  #---------------------ENVIRONMENT---------------------#
  environment = {
    systemPackages = with pkgs; [
      coreutils
      dnslookup
      dig
      git
      kitty.terminfo
      nebula
      pciutils
      raspberrypi-eeprom
      tcpdump
      usbutils
      util-linux
    ];
  };
}
