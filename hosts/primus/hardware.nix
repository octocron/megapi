{ inputs, ... }:
{
  imports = with inputs.nixos-raspberrypi.nixosModules; [
    raspberry-pi-5.base
    raspberry-pi-5.page-size-16k
  ];
  hardware.raspberry-pi.config = {
    base.dt-params = {
      krnbt = {
        enable = false;
      };
      krnrpi = {
        enable = false;
      };
    };
  };
}
