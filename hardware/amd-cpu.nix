{
  lib,
  config,
  ...
}: {
  options.huncs.hardware.amd-cpu.enable = lib.mkEnableOption "amd-cpu";

  config = lib.mkIf config.huncs.hardware.amd-cpu.enable {
    boot.kernelParams = ["microcode.amd_sha_check=off"];
    services.ucodenix = {
      enable = true;
      cpuModelId = lib.mkIf (config.networking.hostName == "desktop") "00B40F40";
    };
  };
}
