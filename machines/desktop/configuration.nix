{pkgs, ...}: {
  imports = [
    ../../boot.nix
    # ../../gnome.nix
    ../../niri.nix
    ../../i18n.nix
    ../../nix.nix
    ../../stylix.nix
    ../../system.nix
    ../../user.nix
    ../../packages/cli.nix
    ../../packages/gui.nix
    ../../services/ssh.nix
    ../../services/auto-cpufreq.nix
    ../../services/openrgb.nix
    ../../services/home-assistant.nix
    ../../services/swww.nix
    ../../programs/adb.nix
    ../../programs/fd.nix
    ../../programs/git.nix
    ../../programs/helix.nix
    ../../programs/zellij.nix
    ../../programs/zoxide.nix
    ../../programs/zen.nix
    ../../programs/nushell.nix
    ../../programs/nh.nix
    ../../programs/obs.nix
    ../../programs/ghostty.nix
    ../../programs/bat.nix
    ../../programs/ripgrep.nix
    ../../programs/starship.nix
    ../../programs/steam.nix
  ];

  networking.hostName = "desktop";

  boot.initrd.kernelModules = [
    "amdgpu" # gpu
    "r8169" # ethernet
    "mt7921e" # wifi
  ];
  boot.kernelModules = [
    "amdgpu" # gpu
    "r8169" # ethernet
    "mt7921e" # wifi
  ];
  services.xserver.videoDrivers = ["amdgpu"];

  systemd.tmpfiles.rules = [
    "L+    /opt/rocm/hip   -    -    -     -    ${pkgs.rocmPackages.clr}"
  ];
  hardware.graphics.extraPackages = with pkgs; [
    rocmPackages.clr.icd
    amdvlk
  ];
  hardware.graphics.extraPackages32 = with pkgs; [
    driversi686Linux.amdvlk
  ];

  system.stateVersion = "25.11";
}
