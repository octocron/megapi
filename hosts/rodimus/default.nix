{
  # INFO: NixOS Headless Raspberry Pi5 using NVME
  system.stateVersion = "26.05";
  imports = [
    ./caddy.nix
    ./disko.nix
    ./hardware.nix
    ./interfaces.nix
    ./motd.nix
    ./nebula.nix
    ../../boot/pi5.nix
    ../../core
    ../../users/megacron.nix
    ../../app/sops.nix
    ../../app/unbound
  ];
}
