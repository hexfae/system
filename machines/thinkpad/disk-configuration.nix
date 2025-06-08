{
  disko.devices = {
    disk = {
      main = {
        device = "/dev/disk/by-path/pci-0000:3e:00.0-nvme-1";
        type = "disk";
        content = {
          type = "gpt";
          partitions = {
            boot = {
              end = "1G";
              type = "EF00";
              content = {
                type = "filesystem";
                format = "vfat";
                mountpoint = "/boot";
                mountOptions = ["umask=0077"];
              };
            };
            root = {
              name = "root";
              size = "100%";
              content = {
                type = "filesystem";
                format = "bcachefs";
                mountpoint = "/";
              };
            };
            swap = {
              end = "22774740480B";
              content = {
                type = "swap";
                discardPolicy = "both";
                resumeDevice = "true";
              };
            };
          };
        };
      };
    };
  };
}
