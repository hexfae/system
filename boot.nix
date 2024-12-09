{...}: {
  boot.plymouth.enable = true;
  boot.initrd.verbose = false;
  boot.kernelParams = ["quiet" "log_level=3" "udev.log_level=3" "rd.udev.log_level=3" "udev.log_priority=3" "systemd.show_status=auto" "splash" "nowatchdog" "nomce" "mitigations=off"];
  boot.tmp.cleanOnBoot = true;
  boot.loader.systemd-boot.enable = true;
  boot.loader.systemd-boot.configurationLimit = 10;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.timeout = 3;
}
