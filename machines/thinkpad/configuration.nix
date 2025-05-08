{...}: {
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
    ../../services/ssh.nix
    ../../services/mullvad.nix
    ../../services/auto-cpufreq.nix
    ../../services/virtualization.nix
    ../../services/syncthing.nix
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
    ../../programs/ghostty.nix
    ../../programs/bat.nix
    ../../programs/ripgrep.nix
    ../../programs/starship.nix
    ../../programs/steam.nix
  ];

  networking.hostName = "thinkpad";

  system.stateVersion = "24.11";
}
