{ nixos-raspberrypi, ... }: {
  imports = [
    nixos-raspberrypi.lib.inject-overlays
    nixos-raspberrypi.nixosModules.nixpkgs-rpi
    nixos-raspberrypi.nixosModules.raspberry-pi-5.base
    nixos-raspberrypi.nixosModules.raspberry-pi-5.bluetooth
    nixos-raspberrypi.nixosModules.raspberry-pi-5.display-vc4
    nixos-raspberrypi.nixosModules.raspberry-pi-5.page-size-16k
    ./pi5.nix
  ];
}
