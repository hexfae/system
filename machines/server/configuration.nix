{
  lib,
  pkgs,
  ...
}: {
  imports = [
    ../../boot.nix
    ../../home.nix
    ../../i18n.nix
    ../../nix.nix
    ../../stylix.nix
    ../../system.nix
    ../../user.nix
    ../../services/ssh.nix
    ../../services/auto-cpufreq.nix
    ../../services/binfmt.nix
    ../../programs/adb.nix
    ../../programs/git.nix
    ../../programs/helix.nix
    ../../programs/zellij.nix
    ../../programs/zoxide.nix
    ../../programs/nushell.nix
    ../../programs/nh.nix
    ../../programs/starship.nix
  ];

  networking.hostName = "server";
  networking.networkmanager.enable = true;
  documentation.enable = false;

  hardware.graphics.enable32Bit = lib.mkForce false;
  boot.kernelPackages = lib.mkForce pkgs.linuxPackages_latest;
  home-manager.users.hexfae.xdg.userDirs.createDirectories = lib.mkForce false;

  environment.systemPackages = with pkgs; [
    wget
  ];

  system.stateVersion = "24.11";
}
