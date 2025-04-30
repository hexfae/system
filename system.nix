{pkgs, ...}: {
  boot.kernelPackages = pkgs.linuxPackages_zen;
  boot.supportedFilesystems = ["bcachefs"];
  programs.gamemode.enable = true;
  security.sudo.wheelNeedsPassword = false;
  security.rtkit.enable = true;

  hardware = {
    enableAllFirmware = true;
    enableRedistributableFirmware = true;
    graphics = {
      enable = true;
      enable32Bit = true;
    };
  };
}
