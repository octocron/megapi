_: {
  #-------------------------BOOT-------------------------------#
  boot = {
    tmp.useTmpfs = true;
    loader = {
      grub.enable = false;
      generic-extlinux-compatible.enable = false;
      raspberry-pi.bootloader = "kernel";
    };
  };
}
