{config, ...}: {
  boot.plymouth.enable = true;
  # boot.plymouth.theme = "bgrt";
  systemd.network.wait-online.enable = false; # took 4 seconds of boot time according to systemd-analyze blame
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.systemd-boot.editor = false;
  boot.loader.timeout = 0;
  boot.blacklistedKernelModules = ["k10temp"];
  boot.extraModulePackages = [config.boot.kernelPackages.zenpower];
  boot.kernelModules = ["zenpower"];
  boot.kernelParams = [
    # silent boot
    "quiet"
    "rd.systemd.show_status=false"
    "udev.log_level=3"
    "rd.udev.log_level=3"
    "udev.log_priority=3"
    "systemd.show_status=auto"
    # turn off mitigations for speed lol
    "nowatchdog"
    "nomce"
    "mitigations=off"
    "noibrs"
    "noibpb"
    "nopti"
    "nospectre_v2"
    "nospectre_v1"
    "l1tf=off"
    "nospec_store_bypass_disable"
    "no_stf_barrier"
    "mds=off"
    "tsx=on"
    "tsx_async_abort=off"
    # amd cpu scaling
    "initcall_blacklist=acpi_cpufreq_init"
    "amd_pstate=passive"
  ];
  boot.consoleLogLevel = 3;
  boot.initrd.verbose = false;
  boot.initrd.systemd.enable = true;
  boot.initrd.compressor = "cat";
  # boot.initrd.compressorArgs = ["-l" "MODULES=dep"];
  systemd.watchdog.rebootTime = "0";
  boot.tmp.cleanOnBoot = true;
  boot.loader.systemd-boot.configurationLimit = 10;
}
