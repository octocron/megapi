{ nixos-raspberrypi, ... }:
{
  imports = [
    nixos-raspberrypi.lib.inject-overlays
    nixos-raspberrypi.nixosModules.raspberry-pi-5.base
    nixos-raspberrypi.nixosModules.raspberry-pi-5.page-size-16k
    nixos-raspberrypi.nixosModules.nixpkgs-rpi
    ./pi5.nix
  ];
}
