{ lib, ... }: {
  #-------------------------BOOT-------------------------------#
  boot = {
    tmp.useTmpfs = true;
    kernel.sysctl."vm.swappiness" = 10;
    kernelParams = [
      "vc4.force_hotplug=3"
      "video=HDMI-A-1:1920x1080@60D"
    ];
    loader = {
      grub.enable = false;
      generic-extlinux-compatible.enable = false;
      raspberry-pi = {
        enable = true;
        bootloader = "kernel";
      };
    };
  };

  nixpkgs.hostPlatform = lib.mkDefault "aarch64-linux";

  zramSwap = {
    enable = true;
    algorithm = "zstd";
    memoryPercent = 50;
    swapDevices = 1;
  };

  swapDevices = [
    {
      device = "/swapfile";
      size = 16 * 1024;
    }
  ];
}
