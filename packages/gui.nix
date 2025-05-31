{pkgs, ...}: {
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
      azahar
      prismlauncher
      lutris
      blender-hip
      librewolf
      (pkgs.bottles.override {removeWarningPopup = true;})
      adwsteamgtk
    ];
  };
}
