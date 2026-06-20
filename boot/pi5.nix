_: {
  #-------------------------BOOT-------------------------------#
  boot = {
    tmp.useTmpfs = true;
    kernel.sysctl."vm.swappiness" = 10;
    loader = {
      grub.enable = false;
      generic-extlinux-compatible.enable = false;
      #raspberry-pi.bootloader = "kernel";
      raspberryPi = {
        enable = true;
        version = 5;
      };
    };
  };

  swapDevices = [
    {
      device = "/swapfile";
      size = 16 * 1024;
    }
  ];
}
