{ inputs, ... }:
{
  imports = with inputs.nixos-raspberrypi; [
    nixpkgs-rpi
    lib.inject-overlays
    nixosModules.raspberry-pi-5.base
    nixosModules.raspberry-pi-5.bluetooth
    nixosModules.raspberry-pi-5.display-vc4
    nixosModules.raspberry-pi-5.page-size-16k
  ];
}
