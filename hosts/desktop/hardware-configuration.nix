{
  config,
  lib,
  modulesPath,
  vars,
  ...
}: {
  imports = [(modulesPath + "/installer/scan/not-detected.nix")];

  boot.initrd.availableKernelModules = ["nvme" "xhci_pci" "ahci" "usbhid" "usb_storage"];
  boot.initrd.systemd.enable = true;
  boot.kernelModules = ["kvm-amd"];
  networking.hostId = "611d21b4";

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  hardware.cpu.amd.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;

  fileSystems = {
    "/home/${vars.username}/mnt/usb" = {
      device = "/dev/disk/by-uuid/D566-24E7";
      fsType = "exfat";
      options = ["uid=1000" "gid=1000" "fmask=0133" "dmask=0022" "nofail"];
    };
    "/home/${vars.username}/mnt/ext" = {
      device = "zext/data";
      fsType = "zfs";
      options = ["zfsutil" "noauto"];
    };
  };
}
