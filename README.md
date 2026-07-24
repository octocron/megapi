# nvmd - nixos-raspberrypi

> This flake uses nvmd flake to build the base image for all types of raspberry pi's.

## Create pi5 Installer Image (live)

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

## ssh to clone my pi-demo flake

> This helps transition to larger flakes. megapi for example usually fails with disko.

1. Boot from USB and `ssh nixos@ipaddress`
2. `lsblk` and `lsblk -f` and make sure you know the device name for disko
3. nvme is likely /dev/nvme0n1 the usb is likely /dev/sda
4. git clone https://gitlab.com/megacron/pi-demo.git
5. follow steps of that readme flake and come back after booting

## Now work on personal flake (mine is megapi)

1. (disko.nix) needs to reflect the nvme disk id we used early to ensure boot continues.
2. make sure you have all your nvmd modules continued as well. (hardware.nix)
3. copy your own sops, ssh, nebula keys as necessary.

> Install your own customization of megapi with similar command  
> since we are at this point on the nvme we can now perform  
> from inside the flake:

```zsh
sudo nixos-rebuild switch --flake .#primus
```

---

## pi4 has different stages and most above does not apply

> we still use nvmd but we do not have flake stages.  
> just using pi4 modules from nixos-raspberrypi.

1. Build the pi4 image from our flake:

```zsh
nix build '.#nixosConfigurations.rpi4.config.system.build.sdImage'
```

2. dd result right onto the flash drive.

```zsh
dd if=/path/to/image.sdImage of=/dev/sdX bs=4M conv=fsync status=progress
```

3. Insert USB || sdcard > prosper
