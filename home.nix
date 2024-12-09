{pkgs, ...}: {
  home-manager.useUserPackages = true;
  home-manager.useGlobalPkgs = true;
  home-manager.users.hexfae.programs.home-manager.enable = true;
  home-manager.users.hexfae.home.stateVersion = "24.05";
  home-manager.users.hexfae.home.sessionVariables.GDK_BACKEND = "wayland,x11,*";
  home-manager.users.hexfae.home.sessionVariables.QT_QPA_PLATFORM = "wayland;xcb";
  home-manager.users.hexfae.home.sessionVariables.SDL_VIDEODRIVER = "wayland";
  home-manager.users.hexfae.home.sessionVariables.CLUTTER_BACKEND = "wayland";
  home-manager.users.hexfae.home.sessionVariables.MOZ_USE_XINPUT2 = "1";
  home-manager.users.hexfae.home.packages = with pkgs; [
    vesktop
    bacon
    obs-studio
    gimp
    dolphin-emu
    lime3ds
    prismlauncher
    lutris
    blender
    yt-dlp
    ffmpeg
    tlrc
    nil
    alejandra
    amberol
    obsidian
    librewolf
    bottles
    celluloid
    distrobox
    kdenlive
  ];
}
