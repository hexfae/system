{pkgs, ...}: {
  imports = [
    ../../boot.nix
    ../../gnome.nix
    ../../home.nix
    ../../i18n.nix
    ../../nix.nix
    ../../stylix.nix
    ../../system.nix
    ../../user.nix
    ../../packages/cli.nix
    ../../packages/gui.nix
    ../../hardware/amd.nix
    ../../hardware/b650-fix-suspend.nix
    ../../services/ssh.nix
    ../../services/mullvad.nix
    ../../services/auto-cpufreq.nix
    ../../services/virtualization.nix
    ../../services/binfmt.nix
    ../../services/openrgb.nix
    ../../programs/adb.nix
    ../../programs/distrobox.nix
    # ../../programs/vesktop.nix
    ../../programs/git.nix
    ../../programs/helix.nix
    ../../programs/zellij.nix
    ../../programs/zoxide.nix
    ../../programs/firefox.nix
    ../../programs/nushell.nix
    ../../programs/nh.nix
    ../../programs/wezterm.nix
    ../../programs/starship.nix
    ../../programs/steam.nix
  ];

  networking.hostName = "desktop";
  boot.kernelModules = [
    "r8169" # ethernet
    "mt7921e" # wifi
  ];
  boot.initrd.kernelModules = [
    "r8169" #ethernet
    "mt7921e" #wifi
  ];
  home-manager.users.hexfae.home.packages = with pkgs; [
    ffmpegthumbnailer
    video-trimmer
    obs-studio
    dolphin-emu
    # fails to build
    # lime3ds
    prismlauncher
    lutris
    blender
    librewolf
    bottles
    adwsteamgtk
  ];

  system.stateVersion = "24.11";
}
