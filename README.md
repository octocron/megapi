# nvmd - nixos-raspberrypi

This flake uses nvmd flake to build the base image for all types of raspberry pi's.

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

## nixos-rebuild switch to personal flake
