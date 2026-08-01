{ lib, ... }:
let
  firmwarePartition = lib.recursiveUpdate {
    priority = 1;
    type = "0700";
    attributes = [ 0 ];
    size = "1024M";
    content = {
      type = "filesystem";
      format = "vfat";
      mountOptions = [
        "noatime"
      ];
    };
  };

  espPartition = lib.recursiveUpdate {
    type = "EF00";
    attributes = [ 2 ];
    size = "1024M";
    content = {
      type = "filesystem";
      format = "vfat";
      mountOptions = [
        "noatime"
        "umask=0077"
      ];
    };
  };
in
{
  disko.devices = {
    disk.nvme = {
      type = "disk";
      # NOTE: ls -l /dev/disk/by-id/
      device = "/dev/disk/by-id/nvme-uuid.eb8af24a-e718-2f45-a943-b63d74b622d5";
      content = {
        type = "gpt";
        partitions = {
          FIRMWARE = firmwarePartition {
            label = "FIRMWARE";
            content.mountpoint = "/boot/firmware";
          };

          ESP = espPartition {
            label = "ESP";
            content.mountpoint = "/boot";
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
}
