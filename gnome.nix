{
  pkgs,
  lib,
  ...
}: {
  nixpkgs.overlays = [
    (final: prev: {
      # until #369069 gets merged: https://nixpk.gs/pr-tracker.html?pr=369069
      gnome-extension-manager = prev.gnome-extension-manager.overrideAttrs (old: {
        src = prev.fetchFromGitHub {
          owner = "mjakeman";
          repo = "extension-manager";
          rev = "v0.6.0";
          hash = "sha256-AotIzFCx4k7XLdk+2eFyJgrG97KC1wChnSlpLdk90gE=";
        };
        patches = [];
        buildInputs = with prev; [
          blueprint-compiler
          gtk4
          json-glib
          libadwaita
          libsoup_3
          libbacktrace
          libxml2
        ];
      });
    })
  ];
  services.xserver.enable = true;
  services.displayManager.autoLogin.user = "hexfae";
  # gnome auto login workaround
  systemd.services."getty@tty1".enable = false;
  systemd.services."autovt@tty1".enable = false;
  services.xserver.excludePackages = [pkgs.xterm];
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.desktopManager.gnome.enable = true;
  services.gnome.evolution-data-server.enable = lib.mkForce false;
  programs.kdeconnect.enable = true;
  programs.kdeconnect.package = pkgs.gnomeExtensions.gsconnect;
  home-manager.users.hexfae.xdg.mime.enable = true;
  home-manager.users.hexfae.xdg.mimeApps.enable = true;
  home-manager.users.hexfae.xdg.mimeApps.defaultApplications."image/jpeg" = "org.gnome.Loupe.desktop";
  home-manager.users.hexfae.xdg.mimeApps.defaultApplications."image/png" = "org.gnome.Loupe.desktop";
  home-manager.users.hexfae.xdg.mimeApps.defaultApplications."x-scheme-handler/sms" = "org.gnome.Shell.Extensions.GSConnect.desktop";
  home-manager.users.hexfae.xdg.mimeApps.defaultApplications."x-scheme-handler/tel" = "org.gnome.Shell.Extensions.GSConnect.desktop";
  home-manager.users.hexfae.xdg.mimeApps.defaultApplications."TerminalEmulator" = "org.wezfurlong.wezterm.desktop";
  home-manager.users.hexfae.dconf.settings = {
    "org/gnome/shell".disable-user-extensions = false;
    "org/gnome/shell".favorite-apps = [
      "firefox.desktop"
      "vesktop.desktop"
      "org.gnome.Nautilus.desktop"
      "org.wezfurlong.wezterm.desktop"
      "com.mattjakeman.ExtensionManager.desktop"
      "org.gnome.Settings.desktop"
      "org.gnome.tweaks.desktop"
      "org.prismlauncher.PrismLauncher.desktop"
      "com.usebottles.bottles.desktop"
    ];
    "org/gnome/desktop/interface".clock-show-seconds = true;
    "org/gnome/desktop/interface".show-battery-percentage = true;
    "org/gnome/desktop/wm/preferences".button-layout = "close,minimize::";
    "org/gnome/desktop/peripherals/mouse".accel-profile = "flat";
    "org/gnome/desktop/privacy".remember-recent-files = false;
    "org/gnome/mutter".experimental-features = ["scale-monitor-framebuffer"];
    "org/gnome/mutter".dynamic-workspaces = true;
  };
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
      media-controls
      tiling-assistant
      runcat
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
    media-controls.extensionUuid
    tiling-assistant.extensionUuid
    runcat.extensionUuid
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
