{config, ...}: {
  services.xserver.videoDrivers = ["amdgpu"];
  hardware.amdgpu.initrd.enable = true;
  boot.extraModulePackages = [config.boot.kernelPackages.zenpower];
  boot.kernelModules = ["zenpower"];
  boot.kernelParams = [
    "initcall_blacklist=acpi_cpufreq_init"
    "amd_pstate=passive"
  ];
}
