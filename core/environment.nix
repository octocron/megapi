{ pkgs, ... }:
{
  #---------------------ENVIRONMENT---------------------#
  environment = {
    systemPackages = with pkgs; [
      #inputs.megavim.packages.${pkgs.system}.default
      coreutils
      git
      kitty.terminfo
      nebula
      pciutils
      raspberrypi-eeprom
      usbutils
      util-linux
    ];
  };
}
