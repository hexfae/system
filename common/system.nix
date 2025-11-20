{
  pkgs,
  lib,
  ...
}: {
  time.timeZone = "Europe/Stockholm";
  console.keyMap = "sv-latin1";
  services.xserver.xkb.layout = "se";
  i18n = {
    defaultLocale = "en_US.UTF-8";
    extraLocaleSettings = {
      LC_ADDRESS = "sv_SE.UTF-8";
      LC_IDENTIFICATION = "sv_SE.UTF-8";
      LC_MEASUREMENT = "sv_SE.UTF-8";
      LC_MONETARY = "sv_SE.UTF-8";
      LC_NAME = "sv_SE.UTF-8";
      LC_NUMERIC = "sv_SE.UTF-8";
      LC_PAPER = "sv_SE.UTF-8";
      LC_TELEPHONE = "sv_SE.UTF-8";
      LC_TIME = "sv_SE.UTF-8";
    };
  };

  boot.kernelPackages = lib.mkOverride 999 pkgs.linuxPackages_cachyos; # 1 higher than default
  # alternative scheduler
  services.scx.enable = lib.mkDefault true;
  # auto nice
  services.ananicy.enable = true;
  services.ananicy.rulesProvider = pkgs.ananicy-rules-cachyos_git;
  chaotic.mesa-git = {
    enable = lib.mkDefault true;
    fallbackSpecialisation = false;
  };
  security.sudo-rs = {
    enable = true;
    wheelNeedsPassword = false;
  };
}
