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
      device = "/dev/disk/by-id/nvme-WD_Blue_SN570_500GB_23180A802928";
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
