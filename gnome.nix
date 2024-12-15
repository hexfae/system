{
  pkgs,
  lib,
  ...
}: {
  services.xserver.enable = true;
  services.displayManager.autoLogin.user = "hexfae";
  services.xserver.excludePackages = [pkgs.xterm];
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.desktopManager.gnome.enable = true;
  programs.kdeconnect.enable = true;
  programs.kdeconnect.package = pkgs.gnomeExtensions.gsconnect;
  home-manager.users.hexfae.xdg.mime.enable = true;
  home-manager.users.hexfae.xdg.mimeApps.enable = true;
  home-manager.users.hexfae.xdg.mimeApps.defaultApplications."image/jpeg" = "org.gnome.Loupe.desktop";
  home-manager.users.hexfae.xdg.mimeApps.defaultApplications."image/png" = "org.gnome.Loupe.desktop";
  home-manager.users.hexfae.xdg.mimeApps.associations.added."x-scheme-handler/sms" = "org.gnome.Shell.Extensions.GSConnect.desktop";
  home-manager.users.hexfae.xdg.mimeApps.associations.added."x-scheme-handler/tel" = "org.gnome.Shell.Extensions.GSConnect.desktop";
  home-manager.users.hexfae.xdg.mimeApps.associations.added."image/jpeg" = "org.gnome.Loupe.desktop";
  home-manager.users.hexfae.xdg.mimeApps.associations.added."image/png" = "org.gnome.Loupe.desktop";
  home-manager.users.hexfae.dconf.settings."org/gnome/shell".disable-user-extensions = false;
  home-manager.users.hexfae.dconf.settings."org/gnome/desktop/interface".clock-show-seconds = true;
  home-manager.users.hexfae.dconf.settings."org/gnome/desktop/interface".show-battery-percentage = true;
  home-manager.users.hexfae.dconf.settings."org/gnome/desktop/wm/preferences".button-layout = "close,minimize::";
  home-manager.users.hexfae.dconf.settings."org/gnome/desktop/peripherals/mouse".accel-profile = "flat";
  home-manager.users.hexfae.dconf.settings."org/gnome/desktop/privacy".remember-recent-files = false;
  home-manager.users.hexfae.dconf.settings."org/gnome/mutter".edge-tiling = true;
  home-manager.users.hexfae.dconf.settings."org/gnome/mutter".experimental-features = ["scale-monitor-framebuffer"];
  home-manager.users.hexfae.dconf.settings."org/gnome/mutter".dynamic-workspaces = true;
  home-manager.users.hexfae.home.packages =
    (with pkgs; [
      gnome-tweaks
      gnome-extension-manager
      resources
    ])
    ++ (with pkgs.gnomeExtensions; [
      dash-to-dock
      blur-my-shell
      gsconnect
      pano
      appindicator
      vitals
      quick-settings-audio-panel
      rounded-window-corners-reborn
    ]);
  home-manager.users.hexfae.dconf.settings."org/gnome/shell".enabled-extensions = with pkgs.gnomeExtensions; [
    blur-my-shell.extensionUuid
    dash-to-dock.extensionUuid
    pano.extensionUuid
    gsconnect.extensionUuid
    appindicator.extensionUuid
    vitals.extensionUuid
    quick-settings-audio-panel.extensionUuid
    rounded-window-corners-reborn.extensionUuid
  ];
  environment.gnome.excludePackages = with pkgs; [
    baobab
    epiphany
    geary
    snapshot
    totem
    evince
    simple-scan
    seahorse
    yelp
    adwaita-icon-theme
    gnome-themes-extra
    gnome-tour
    gnome-connections
    gnome-calendar
    gnome-user-docs
    gnome-font-viewer
    gnome-console
    gnome-disk-utility
    gnome-system-monitor
    gnome-text-editor
    gnome-music
    gnome-contacts
    gnome-weather
    gnome-clocks
    gnome-maps
    gnome-characters
    gnome-logs
    gnome-shell-extensions
  ];
}
