{
  lib,
  pkgs,
  ...
}: {
  imports = [
    ../../boot.nix
    ../../i18n.nix
    ../../nix.nix
    ../../stylix.nix
    ../../system.nix
    ../../user.nix
    ../../packages/cli.nix
    ../../services/ssh.nix
    ../../services/auto-cpufreq.nix
    ../../services/transmission.nix
    # ../../services/discordtavern.nix
    ../../services/harry.nix
    ../../programs/adb.nix
    ../../programs/git.nix
    ../../programs/helix.nix
    ../../programs/zellij.nix
    ../../programs/zoxide.nix
    ../../programs/nushell.nix
    ../../programs/nh.nix
    ../../programs/bat.nix
    ../../programs/ripgrep.nix
    ../../programs/starship.nix
  ];

  networking = {
    hostName = "server";
    networkmanager.enable = true;
    firewall = {
      enable = true;
      allowedTCPPorts = [
        8000
        443
      ];
    };
  };

  documentation.enable = false;
  hardware.graphics.enable32Bit = lib.mkForce false;
  # building linux_zen failed for me
  boot.kernelPackages = lib.mkForce pkgs.linuxPackages_latest;
  home-manager.users.hexfae.xdg.userDirs.createDirectories = lib.mkForce false;

  system.stateVersion = "24.11";
}
