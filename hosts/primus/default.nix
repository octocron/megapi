_: {
  # INFO: NixOS Headless Raspberry Pi5 using NVME
  system.stateVersion = "26.05";
  imports = [
    ./hardware.nix
    ./disko.nix
    ../../boot/pi5.nix
    ../../core
    ../../users/megacron.nix
  ];

  system.activationScripts.nvmdBootSync = ''
    set -euo pipefail

    BOOT_DIR=/boot/firmware/nixos/default

    echo "[nvmd-sync] updating boot pointer"

    mkdir -p "$BOOT_DIR"

    ln -sfn "$systemConfig" "$BOOT_DIR/system-link"

    sync
  '';
}
