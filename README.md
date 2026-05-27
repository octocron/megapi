# nvmd - nixos-raspberrypi

> This flake uses nvmd flake to build the base image for all types of raspberry pi's.

## Create the Installer Image (live)

1. git clone https://github.com/nvmd/nixos-raspberrypi
2. add to flake.nix in the custom-user-config section (adjust to your key):

```nix
  users.users.nixos.openssh.authorizedKeys.keys = [
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIM7Nb8wXQWd9H69U6TzPoE1MJDzUbGZSwwJCaXBvzgdb megacron"
  ];
  users.users.root.openssh.authorizedKeys.keys = [
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIM7Nb8wXQWd9H69U6TzPoE1MJDzUbGZSwwJCaXBvzgdb megacron"
  ];

  environment.systemPackages = with pkgs; [
    curl
    file
    git
    htop
    nix-output-monitor
    nvd
    parted
    rsync
    tre
  ];
```

3. Build Image (pi5 result): `nix build .#installerImages.rpi5`
4. Uncompress Image: `nix shell nixpkgs#zstd -c unzstd -d result/sd-image/*.img.zst`
5. Use BalenaEtcher to place image on USB or SD card.

## add disko to personal flake

1. Boot from USB and `ssh nixos@ipaddress`
2. `lsblk` and `lsblk -f` and make sure you know the device name for disko.
3. nvme is likely /dev/nvme0n1 the usb is likely /dev/sda
4. create a disko.nix for each host

```nix
{
  disko.devices = {
    disk = {
      nvme = {
        device = "/dev/nvme0n1";
        type = "disk";
        content = {
          type = "gpt";
          partitions = {
            ESP = {
              size = "512M";
              type = "EF00";
              content = {
                type = "filesystem";
                format = "vfat";
                mountpoint = "/boot";
              };
            };
            root = {
              size = "100%";
              content = {
                type = "filesystem";
                format = "ext4";
                mountpoint = "/";
              };
            };
          };
        };
      };
    };
  };
}
```

## Ensure nvmd is integrated in personal flake

1. add inputs in flake.nix

```nix
inputs = {
  nixos-anywhere.url = "github:nix-community/nixos-anywhere";
  nixos-raspberrypi.url = "github:nvmd/nixos-raspberrypi/main";
};
```

> do not forget to include in your outputs!

2. create a hardware.nix next to your disko.nix

```nix
{ inputs, ... }:
{
  imports = with inputs.nixos-raspberrypi.nixosModules; [
    raspberry-pi-5.base
    raspberry-pi-5.page-size-16k
  ];
}
```
