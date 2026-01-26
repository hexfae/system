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

  boot.kernelPackages = lib.mkDefault pkgs.linuxPackages_xanmod_latest;
  boot.zfs.package = pkgs.zfs_unstable;

  zramSwap.enable = true;
  boot.tmp.useTmpfs = true;

  # alternative scheduler
  services.scx = {
    enable = lib.mkIf notServer true;
    scheduler = "scx_lavd";
  };
  # auto nice
  services.ananicy = {
    enable = true;
    package = pkgs.ananicy-cpp;
    rulesProvider = pkgs.ananicy-rules-cachyos;
  };
  security.sudo-rs = {
    enable = true;
    wheelNeedsPassword = false;
  };
}
