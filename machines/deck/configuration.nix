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
    ../../services/mullvad.nix
    ../../services/auto-cpufreq.nix
    ../../services/virtualization.nix
    ../../programs/adb.nix
    ../../programs/git.nix
    ../../programs/helix.nix
    ../../programs/zellij.nix
    ../../programs/zoxide.nix
    ../../programs/zen.nix
    ../../programs/nushell.nix
    ../../programs/nh.nix
    ../../programs/ghostty.nix
    ../../programs/bat.nix
    ../../programs/ripgrep.nix
    ../../programs/starship.nix
    ../../programs/steam.nix
  ];

  networking.hostName = "deck";
  # jovian.steam.enable = true;
  jovian = {
    devices.steamdeck = {
      enable = true;
      autoUpdate = true;
      enableGyroDsuService = true;
    };
    steamos = {
      enableBluetoothConfig = true;
      enableDefaultCmdlineConfig = true;
      enableEarlyOOM = true;
      enableVendorRadv = true;
      enableMesaPatches = true;
      enableProductSerialAccess = true;
      enableZram = true;
      enableSysctlConfig = true;
    };
    # jupiter-fan-control service produces error when switching
    devices.steamdeck.enableOsFanControl = false;
  };
  home-manager.users.hexfae.home.packages = [pkgs.lime3ds];

  system.stateVersion = "24.05";
}
