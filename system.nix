{pkgs, ...}: {
  hardware.enableAllFirmware = true;
  hardware.graphics.enable = true;
  hardware.graphics.enable32Bit = true;
  hardware.enableRedistributableFirmware = true;
  boot.kernelPackages = pkgs.linuxPackages_zen;
  boot.supportedFilesystems = ["bcachefs"];
  programs.gamemode.enable = true;
  security.sudo.wheelNeedsPassword = false;
  security.rtkit.enable = true;
}
