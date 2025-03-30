{...}: {
  systemd.network.wait-online.enable = false;
  systemd.services.NetworkManager-wait-online.enable = false;
  services.journald.extraConfig = "SystemMaxUse=10M";
  boot.plymouth.enable = true;
  boot.tmp.cleanOnBoot = true;
  boot.initrd.compressor = "cat";
  boot.initrd.verbose = false;
  boot.initrd.systemd.enable = true;
  boot.loader.systemd-boot.enable = true;
  boot.loader.systemd-boot.editor = false;
  boot.loader.systemd-boot.configurationLimit = 10;
  boot.loader.timeout = 0;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.consoleLogLevel = 3;
  boot.kernelParams = [
    "quiet"
    "rd.systemd.show_status=false"
    "udev.log_level=3"
    "rd.udev.log_level=3"
    "udev.log_priority=3"
    "systemd.show_status=auto"
  ];
}
