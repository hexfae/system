{pkgs, ...}: {
  home-manager.users.hexfae = {
    services.polkit-gnome.enable = true;
    xdg = {
      mimeApps.enable = true;
      portal = {
        enable = true;
        xdgOpenUsePortal = true;
        extraPortals = with pkgs; [
          xdg-desktop-portal-gtk
          xdg-desktop-portal-gnome
          gnome-keyring
        ];
        configPackages = with pkgs; [
          xdg-desktop-portal-gtk
          xdg-desktop-portal-gnome
          gnome-keyring
        ];
      };
    };
    home = {
      sessionVariables = {
        GDK_BACKEND = "wayland,x11,*";
        QT_QPA_PLATFORM = "wayland;xcb";
        SDL_VIDEODRIVER = "wayland";
        CLUTTER_BACKEND = "wayland";
        ELECTRON_OZONE_PLATFORM_HINT = "auto";
        NIXOS_OZONE_WL = "1";
        MOZ_USE_XINPUT2 = "1";
        SDL_VIDEO_MINIMIZE_ON_FOCUS_LOSS = "0";
        FREETYPE_PROPERTIES = "cff:no-stem-darkening=0 autofitter:no-stem-darkening=0";
      };
      packages = with pkgs; [
        kdePackages.kdenlive
        loupe
        celluloid
        resources
        gimp
        obsidian
        obs-studio
        blender-hip
        librewolf
        (pkgs.bottles.override {removeWarningPopup = true;})
      ];
    };
  };
}
