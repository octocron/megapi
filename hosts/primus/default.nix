_: {
  # INFO: NixOS Headless Raspberry Pi5 using NVME
  system.stateVersion = "26.05";
  imports = [
    ./hardware.nix
    ./disko.nix
    ./nebula.nix
    ../../boot/pi5.nix
    ../../core
    ../../users/megacron.nix
    ../../app/caddy.nix
    ../../app/technitium.nix
  ];
}
