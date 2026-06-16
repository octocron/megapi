_: {
  # INFO: NixOS Headless Raspberry Pi5 using NVME
  system.stateVersion = "26.05";
  imports = [
    ../../boot/pi5.nix
    ../../core
    ./hardware.nix
    ../../users/megacron.nix
  ];
}
