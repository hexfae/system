{
  config,
  lib,
  modulesPath,
  vars,
  ...
}: {
  imports = [
    (modulesPath + "/installer/scan/not-detected.nix")
  ];

  boot.initrd.availableKernelModules = ["nvme" "xhci_pci" "ahci" "usbhid" "usb_storage"];
  boot.initrd.kernelModules = [];
  boot.kernelModules = ["kvm-amd"];
  boot.extraModulePackages = [];

  fileSystems."/" = {
    device = "/dev/disk/by-uuid/ae16ba6d-33fe-4380-ae88-a28e4c4046a4";
    fsType = "bcachefs";
  };

  fileSystems."/boot" = {
    device = "/dev/disk/by-uuid/6193-8A7F";
    fsType = "vfat";
    options = ["fmask=0022" "dmask=0022"];
  };

  fileSystems."/home/${vars.username}/mnt/usb" = {
    device = "/dev/disk/by-uuid/D566-24E7";
    fsType = "exfat";
    options = ["uid=1000" "gid=1000" "fmask=0133" "dmask=0022" "nofail"];
  };

  fileSystems."/home/${vars.username}/mnt/win" = {
    device = "/dev/disk/by-uuid/1ABCD52DBCD503E3";
    fsType = "ntfs";
    options = ["uid=1000" "gid=1000" "fmask=0133" "dmask=0022" "nofail"];
  };

  fileSystems."/home/${vars.username}/mnt/ext" = {
    device = "/dev/disk/by-uuid/520601f3-187a-4a66-a468-5b109f8a83f1";
    fsType = "bcachefs";
    options = ["noauto"];
  };

  swapDevices = [
    {device = "/dev/disk/by-uuid/3ceaefbd-bbc6-4d7c-b162-d457df02c5e7";}
  ];

  # Enables DHCP on each ethernet and wireless interface. In case of scripted networking
  # (the default) this is the recommended approach. When using systemd-networkd it's
  # still possible to use this option, but it's recommended to use it in conjunction
  # with explicit per-interface declarations with `networking.interfaces.<interface>.useDHCP`.
  networking.useDHCP = lib.mkDefault true;
  # networking.interfaces.eno1.useDHCP = lib.mkDefault true;
  # networking.interfaces.wlp11s0.useDHCP = lib.mkDefault true;

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  hardware.cpu.amd.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
}
