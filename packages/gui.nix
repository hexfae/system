{pkgs, ...}: {
  nixpkgs.overlays = [
    (final: prev: {
      windsurf = prev.windsurf.overrideAttrs (oldAttrs: {
        version = "1.7.0";
        src = prev.fetchurl {
          url = "https://windsurf-stable.codeiumdata.com/linux-x64/stable/69a900001328c5e276063fc33dcff89076073a54/Windsurf-linux-x64-1.7.0.tar.gz";
          sha256 = "sha256-2HHTNBdAnEGKv1lH/cVxI66i2F0pk1k60QKeyUI7C0w=";
        };
      });
    })
  ];
  home-manager.users.hexfae.home = {
    sessionVariables = {
      GDK_BACKEND = "wayland,x11,*";
      QT_QPA_PLATFORM = "wayland;xcb";
      SDL_VIDEODRIVER = "wayland";
      CLUTTER_BACKEND = "wayland";
      NIXOS_OZONE_WL = "1";
      MOZ_USE_XINPUT2 = "1";
      FREETYPE_PROPERTIES = "cff:no-stem-darkening=0 autofitter:no-stem-darkening=0";
    };
    packages = with pkgs; [
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
  };
}
