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

  networking.hostName = "deck";
  # jovian.steam.enable = true;
  jovian.devices.steamdeck.enable = true;
  jovian.devices.steamdeck.autoUpdate = true;
  jovian.devices.steamdeck.enableGyroDsuService = true;
  jovian.steamos.enableBluetoothConfig = true;
  jovian.steamos.enableDefaultCmdlineConfig = true;
  jovian.steamos.enableEarlyOOM = true;
  jovian.steamos.enableVendorRadv = true;
  jovian.steamos.enableMesaPatches = true;
  jovian.steamos.enableProductSerialAccess = true;
  jovian.steamos.enableZram = true;
  jovian.steamos.enableSysctlConfig = true;
  # jupiter-fan-control service produces error when switching
  jovian.devices.steamdeck.enableOsFanControl = false;
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
