{
  flake.modules.nixos.systemd-boot.boot = {
    plymouth.enable = true;
    consoleLogLevel = 3;
    initrd.verbose = false;
    kernelParams = ["quiet" "udev.log_level=3" "systemd.show_status=auto"];
  };
}
