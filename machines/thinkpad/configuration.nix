{lib, ...}: {
  imports = [
    ../../boot.nix
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
    ../../services/swww.nix
    ../../programs/adb.nix
    ../../programs/fd.nix
    ../../programs/git.nix
    ../../programs/helix.nix
    ../../programs/zellij.nix
    ../../programs/zoxide.nix
    ../../programs/zed-editor.nix
    ../../programs/zen.nix
    ../../programs/nushell.nix
    ../../programs/nh.nix
    ../../programs/ghostty.nix
    ../../programs/bat.nix
    ../../programs/ripgrep.nix
    ../../programs/starship.nix
    ../../programs/steam.nix
  ];

  networking.hostName = "thinkpad";

  home-manager.users.hexfae.home.stateVersion = lib.mkForce "25.05";

  system.stateVersion = "25.05";
}
