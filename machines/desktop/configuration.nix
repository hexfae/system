{
  pkgs,
  lib,
  ...
}: {
  imports = [../boot.nix ../gnome.nix ../home.nix ../i18n.nix ../nix.nix ../programs ../stylix.nix ../system.nix ../user.nix];

  networking.hostName = "desktop";
  # my motherboard has an issue where it immediately wakes up from suspend, this fixes it
  services.udev.extraRules = lib.concatStringsSep ", " [
    ''ACTION=="add"''

    ''SUBSYSTEM=="pci"''
    ''ATTR{vendor}=="0x1022"''
    ''ATTR{device}=="0x15b6"''

    ''ATTR{power/wakeup}="disabled"''
  ];
  services.hardware.openrgb.enable = true;
  programs.steam.enable = true;
  programs.steam.extraCompatPackages = [pkgs.proton-ge-bin];
  programs.steam.extest.enable = true;
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
