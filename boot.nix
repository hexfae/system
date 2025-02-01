{...}: {
  boot.plymouth.enable = true;
  # boot.plymouth.theme = "bgrt";
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.systemd-boot.editor = false;
  boot.loader.timeout = 0;
  boot.kernelParams = ["quiet" "rd.systemd.show_status=false" "udev.log_level=3" "rd.udev.log_level=3" "udev.log_priority=3" "systemd.show_status=auto" "nowatchdog" "nomce" "mitigations=off"];
  boot.consoleLogLevel = 0;
  boot.initrd.verbose = false;
  boot.initrd.systemd.enable = true;
  boot.initrd.compressor = "cat";
  # boot.initrd.compressorArgs = ["-l" "MODULES=dep"];
  systemd.watchdog.rebootTime = "0";
  boot.tmp.cleanOnBoot = true;
  boot.loader.systemd-boot.configurationLimit = 10;
}
