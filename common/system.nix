{
  pkgs,
  lib,
  config,
  ...
}: let
  notServer = config.networking.hostName != "server";
in {
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

  boot.binfmt.emulatedSystems = lib.mkIf notServer ["aarch64-linux"];

  zramSwap.enable = true;
  boot = {
    tmp.useTmpfs = true;
    kernelPackages = lib.mkIf notServer (lib.mkDefault pkgs.linuxPackages_cachyos-lto-znver4);
  };

  # alternative scheduler
  services.scx = {
    enable = lib.mkIf notServer true;
    scheduler = "scx_lavd";
  };
  # auto nice
  services.ananicy = {
    enable = true;
    rulesProvider = pkgs.ananicy-rules-cachyos_git;
  };
  chaotic.mesa-git = {
    enable = lib.mkIf notServer true;
    fallbackSpecialisation = false;
  };
  security.sudo-rs = {
    enable = true;
    wheelNeedsPassword = false;
  };
}
