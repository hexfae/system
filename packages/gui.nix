{pkgs, ...}: {
  nixpkgs.overlays = [
    (final: prev: {
      windsurf = prev.windsurf.overrideAttrs (oldAttrs: {
        version = "1.5.9";
        src = prev.fetchurl {
          url = "https://windsurf-stable.codeiumdata.com/linux-x64/stable/b3241b91445f79878ccc91626dfe190f90563e53/Windsurf-linux-x64-1.5.9.tar.gz";
          sha256 = "sha256-3jPS64q1qiTuRbzA+K9vlzMR8bSaLA4xw/EODGN0z3M=";
        };
      });
    })
  ];
  home-manager.users.hexfae.home.sessionVariables.GDK_BACKEND = "wayland,x11,*";
  home-manager.users.hexfae.home.sessionVariables.QT_QPA_PLATFORM = "wayland;xcb";
  home-manager.users.hexfae.home.sessionVariables.SDL_VIDEODRIVER = "wayland";
  home-manager.users.hexfae.home.sessionVariables.CLUTTER_BACKEND = "wayland";
  home-manager.users.hexfae.home.sessionVariables.MOZ_USE_XINPUT2 = "1";
  home-manager.users.hexfae.home.sessionVariables.FREETYPE_PROPERTIES = "cff:no-stem-darkening=0 autofitter:no-stem-darkening=0";
  home-manager.users.hexfae.home.packages = with pkgs; [
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
