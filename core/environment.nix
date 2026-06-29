{ pkgs, ... }:
{
  #---------------------ENVIRONMENT---------------------#
  environment = {
    systemPackages = with pkgs; [
      #inputs.megavim.packages.${pkgs.system}.default
      coreutils
      git
      pciutils
      raspberrypi-eeprom
      usbutils
      util-linux
    ];
  };
}
