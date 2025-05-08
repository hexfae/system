{pkgs, ...}: {
  nixpkgs.overlays = [
    (final: prev: {
      windsurf = prev.windsurf.overrideAttrs (oldAttrs: {
        version = "1.8.2";
        src = prev.fetchurl {
          url = "https://windsurf-stable.codeiumdata.com/linux-x64/stable/eccc45da0d0c40e57275e0cce7db644c7b1278d8/Windsurf-linux-x64-1.8.2.tar.gz";
          sha256 = "sha256-Z3eToGV1Qo2V4a1zoAY1gPEWyUZ8EAygshi2qJJiuis=";
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
