_: {
  # INFO: NixOS Headless Raspberry Pi5 using NVME
  system.stateVersion = "26.05";
  imports = [
    ./disko.nix
    ./hardware.nix
    ./nebula.nix
    ../../boot/pi5.nix
    ../../core
    ../../home/wm/caelestia.nix
    ../../users/megacron.nix
    ../../app/sops.nix
  ];
}
