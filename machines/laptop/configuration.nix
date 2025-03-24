{pkgs, ...}: {
  imports = [
    ../../boot.nix
    ../../gnome.nix
    ../../i18n.nix
    ../../nix.nix
    ../../stylix.nix
    ../../system.nix
    ../../user.nix
    ../../packages/cli.nix
    ../../packages/gui.nix
    ../../hardware/amd.nix
    ../../services/mullvad.nix
    ../../services/auto-cpufreq.nix
    ../../services/virtualization.nix
    ../../services/binfmt.nix
    ../../programs/adb.nix
    ../../programs/distrobox.nix
    ../../programs/vesktop.nix
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

  networking.hostName = "laptop";
  home-manager.users.hexfae.home.packages = with pkgs; [
    obs-studio
    dolphin-emu
    lime3ds
    prismlauncher
    lutris
    blender
    librewolf
    bottles
    adwsteamgtk
  ];

  system.stateVersion = "24.05";
}
