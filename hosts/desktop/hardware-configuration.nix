{
  config,
  lib,
  modulesPath,
  vars,
  ...
}: {
  imports = [(modulesPath + "/installer/scan/not-detected.nix")];

  boot.initrd.availableKernelModules = ["nvme" "xhci_pci" "ahci" "usbhid" "usb_storage"];
  boot.initrd.kernelModules = [];
  boot.initrd.systemd.enable = true;
  boot.kernelModules = ["kvm-amd"];
  boot.extraModulePackages = [];
  boot.supportedFilesystems = ["zfs"];
  networking.hostId = "611d21b4";

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  hardware.cpu.amd.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;

  systemd.tmpfiles.rules = [
    "d /home/${vars.username}/mnt 755 ${vars.username} users"
  ];
  fileSystems = {
    "/" = {
      device = "none";
      fsType = "tmpfs";
      options = ["defaults" "size=25%" "mode=755"];
    };
    "/boot" = {
      device = "/dev/disk/by-uuid/6193-8A7F";
      fsType = "vfat";
      options = ["fmask=0022" "dmask=0022"];
    };
    "/nix" = {
      device = "zroot/nix";
      fsType = "zfs";
      neededForBoot = true;
    };
    "/preserve" = {
      device = "zroot/preserve";
      fsType = "zfs";
      neededForBoot = true;
    };
    "/home/${vars.username}/mnt/usb" = {
      device = "/dev/disk/by-uuid/D566-24E7";
      fsType = "exfat";
      options = ["uid=1000" "gid=1000" "fmask=0133" "dmask=0022" "nofail"];
    };
    "/home/${vars.username}/mnt/win" = {
      device = "/dev/disk/by-uuid/1ABCD52DBCD503E3";
      fsType = "ntfs";
      options = ["uid=1000" "gid=1000" "fmask=0133" "dmask=0022" "nofail"];
    };
    # "/home/${vars.username}/mnt/ext" = {
    #   device = "/dev/disk/by-uuid/520601f3-187a-4a66-a468-5b109f8a83f1";
    #   fsType = "bcachefs";
    #   options = ["noauto"];
    # };
  };
}
