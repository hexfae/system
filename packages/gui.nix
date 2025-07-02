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
      kdePackages.kdenlive
      vesktop
      gimp
      obsidian
      obs-studio
      dolphin-emu
      azahar
      prismlauncher
      blender-hip
      librewolf
      (pkgs.bottles.override {removeWarningPopup = true;})
    ];
  };
}
