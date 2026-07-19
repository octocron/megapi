{ pkgs, ... }:
{
  #---------------------ENVIRONMENT---------------------#
  environment = {
    systemPackages = with pkgs; [
      #inputs.megavim.packages.${pkgs.system}.default
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
