{pkgs, ...}: {
  boot.kernelPackages = pkgs.linuxPackages_zen;
  boot.supportedFilesystems = ["bcachefs"];
  programs.gamemode.enable = true;
  security.sudo.wheelNeedsPassword = false;
  security.rtkit.enable = true;

  boot.kernelModules = ["amdgpu"];
  boot.initrd.kernelModules = ["amdgpu"];
  services.xserver.videoDrivers = ["amdgpu"];
  systemd.tmpfiles.rules = [
    "L+    /opt/rocm/hip   -    -    -     -    ${pkgs.rocmPackages.clr}"
  ];
  hardware = {
    enableAllFirmware = true;
    enableRedistributableFirmware = true;
    graphics = {
      enable = true;
      enable32Bit = true;
      extraPackages = with pkgs; [
        rocmPackages.clr.icd
        amdvlk
      ];
      extraPackages32 = with pkgs; [
        driversi686Linux.amdvlk
      ];
    };
  };
}
