{ config, ... }:
{
  # INFO: NixOS Headless Raspberry Pi5 using NVME
  system.stateVersion = "26.05";
  imports = [
    ./hardware.nix
    ./disko.nix
    ../../boot/pi5.nix
    ../../core
    ../../users/megacron.nix
  ];

  system.activationScripts.nvmdBootSync = {
    text = ''
      set -euo pipefail

      BOOT_DIR=/boot/firmware/nixos/default
      TARGET="${config.system.build.toplevel}"

      echo "[nvmd-sync] forcing boot default -> $TARGET"

      mkdir -p "$BOOT_DIR"
      ln -sfn "$TARGET" "$BOOT_DIR/system-link"

      sync
    '';
  };
}
