{pkgs, ...}: {
  imports = [../../boot.nix ../../gnome.nix ../../home.nix ../../i18n.nix ../../nix.nix ../../programs ../../stylix.nix ../../system.nix ../../user.nix];

  networking.hostName = "deck";
  # jovian.steam.enable = true;
  programs.steam.enable = true;
  programs.steam.extraCompatPackages = [pkgs.proton-ge-bin];
  programs.steam.extest.enable = true;
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
