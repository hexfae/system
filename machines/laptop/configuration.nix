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
    ../../programs/git.nix
    ../../programs/helix.nix
    ../../programs/zellij.nix
    ../../programs/zoxide.nix
    ../../programs/firefox.nix
    ../../programs/nushell.nix
    ../../programs/wezterm.nix
    ../../programs/starship.nix
  ];

  networking.hostName = "laptop";
  # jovian.steam.enable = true;
  programs.steam.enable = true;
  programs.steam.extraCompatPackages = [pkgs.proton-ge-bin];
  programs.steam.extest.enable = true;
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
