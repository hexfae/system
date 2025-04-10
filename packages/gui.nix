{pkgs, ...}: {
  nixpkgs.overlays = [
    (final: prev: {
      windsurf = prev.windsurf.overrideAttrs (oldAttrs: {
        version = "1.6.3";
        src = prev.fetchurl {
          url = "https://windsurf-stable.codeiumdata.com/linux-x64/stable/f8ec5d648c43a2f1e54dccd12e2cf74f5ae6bad9/Windsurf-linux-x64-1.6.3.tar.gz";
          sha256 = "sha256-7QhT3IM6l5+l7ZHK+NthkbVYPoPXnMb+61aXzTrhdEA=";
        };
      });
    })
  ];
  home-manager.users.hexfae.home.sessionVariables.GDK_BACKEND = "wayland,x11,*";
  home-manager.users.hexfae.home.sessionVariables.QT_QPA_PLATFORM = "wayland;xcb";
  home-manager.users.hexfae.home.sessionVariables.SDL_VIDEODRIVER = "wayland";
  home-manager.users.hexfae.home.sessionVariables.CLUTTER_BACKEND = "wayland";
  home-manager.users.hexfae.home.sessionVariables.NIXOS_OZONE_WL = "1";
  home-manager.users.hexfae.home.sessionVariables.MOZ_USE_XINPUT2 = "1";
  home-manager.users.hexfae.home.sessionVariables.FREETYPE_PROPERTIES = "cff:no-stem-darkening=0 autofitter:no-stem-darkening=0";
  home-manager.users.hexfae.home.packages = with pkgs; [
    aseprite
    jetbrains.idea-community-bin
    kdePackages.kdenlive
    windsurf
    vesktop
    gimp
    amberol
    obsidian
    celluloid
    video-trimmer
    obs-studio
    dolphin-emu
    # fails to build
    # lime3ds
    prismlauncher
    lutris
    blender-hip
    librewolf
    bottles
    adwsteamgtk
  ];
}
