{
  fileSystems."/nix".neededForBoot = true;
  fileSystems."/preserve".neededForBoot = true;
  disko.devices = {
    disk.main = {
      type = "disk";
      device = "/dev/disk/by-id/nvme-KINGSTON_SNV3S1000G_50026B73836CC603";
      content = {
        type = "gpt";
        partitions = {
          ESP = {
            size = "1G";
            type = "EF00";
            content = {
              type = "filesystem";
              format = "vfat";
              mountpoint = "/boot";
              mountOptions = ["umask=0077"];
            };
          };
          zfs = {
            size = "100%";
            content = {
              type = "zfs";
              pool = "zroot";
            };
          };
        };
      };
    };
    nodev."/" = {
      fsType = "tmpfs";
      mountOptions = [
        "defaults"
        "size=8G"
        "mode=755"
      ];
    };
    zpool.zroot = {
      type = "zpool";
      options = {
        ashift = "12";
        autotrim = "on";
      };
      rootFsOptions = {
        encryption = "aes-256-gcm";
        keylocation = "prompt";
        keyformat = "passphrase";
        compression = "zstd";
        xattr = "sa";
        acltype = "posixacl";
        atime = "off";
        recordsize = "1M";
        normalization = "formD";
        mountpoint = "none";
        canmount = "off";
      };
      datasets = {
        nix = {
          type = "zfs_fs";
          mountpoint = "/nix";
          options = {
            mountpoint = "legacy";
            recordsize = "128k";
          };
        };
        preserve = {
          type = "zfs_fs";
          mountpoint = "/preserve";
          options.mountpoint = "legacy";
        };
      };
    };
  };
}
