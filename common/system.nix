{pkgs, ...}: {
  time.timeZone = "Europe/Stockholm";
  boot.kernelPackages = pkgs.linuxPackages_cachyos;
  # alternative scheduler
  services.scx.enable = true;
  # auto nice
  services.ananicy.enable = true;
  services.ananicy.rulesProvider = pkgs.ananicy-rules-cachyos_git;
  chaotic.mesa-git = {
    enable = true;
    fallbackSpecialisation = false;
  };
  security.sudo-rs = {
    enable = true;
    wheelNeedsPassword = false;
  };
}
