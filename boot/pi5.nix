_: {
  #-------------------------BOOT-------------------------------#
  boot = {
    tmp.useTmpfs = true;
    kernel.sysctl."vm.swappiness" = 10;
    loader = {
      grub.enable = false;
      generic-extlinux-compatible.enable = false;
      raspberry-pi = {
        enable = true;
        bootloader = "kernel";
      };
    };
  };

  zramSwap = {
    enable = true;
    memoryPercent = 50;
  };

  swapDevices = [
    {
      device = "/swapfile";
      size = 16 * 1024;
    }
  ];
}
