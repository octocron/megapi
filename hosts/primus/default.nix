_: {
  # INFO: NixOS Headless Raspberry Pi5 using NVME
  system.stateVersion = "26.05";
  imports = [
    ./caddy.nix
    ./disko.nix
    ./hardware.nix
    ./nebula.nix
    ../../boot/pi5.nix
    ../../core
    ../../users/megacron.nix
    ../../app/homepage.nix
    ../../app/sops.nix
    ../../app/unbound
  ];
}
