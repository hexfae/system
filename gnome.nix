{
  pkgs,
  lib,
  ...
}: {
  services = {
    xserver.enable = true;
    displayManager.autoLogin.user = "hexfae";
    libinput.mouse.accelProfile = "flat";
    flatpak.enable = true;
    dbus = {
      enable = true;
      implementation = "broker";
    };
    xserver = {
      excludePackages = [pkgs.xterm];
      displayManager.gdm.enable = true;
      desktopManager.gnome.enable = true;
    };
    gnome = {
      evolution-data-server.enable = lib.mkForce false;
      gnome-browser-connector.enable = true;
    };
  };
  # gnome auto login workaround
  systemd.services = {
    "getty@tty1".enable = false;
    "autovt@tty1".enable = false;
  };
  programs.nautilus-open-any-terminal = {
    enable = true;
    terminal = "ghostty";
  };
  programs.kdeconnect = {
    enable = true;
    package = pkgs.gnomeExtensions.gsconnect;
  };
  home-manager.users.hexfae = {
    xdg = {
      mime.enable = true;
      mimeApps = {
        enable = true;
        defaultApplications = {
          "image/jpeg" = "org.gnome.Loupe.desktop";
          "image/png" = "org.gnome.Loupe.desktop";
          "x-scheme-handler/sms" = "org.gnome.Shell.Extensions.GSConnect.desktop";
          "x-scheme-handler/tel" = "org.gnome.Shell.Extensions.GSConnect.desktop";
          "TerminalEmulator" = "com.mitchellh.ghostty.desktop";
          "text/html" = "firefox.desktop";
          "x-scheme-handler/http" = "firefox.desktop";
          "x-scheme-handler/https" = "firefox.desktop";
          "x-scheme-handler/about" = "firefox.desktop";
          "x-scheme-handler/unknown" = "firefox.desktop";
        };
      };
    };
    dconf.settings = {
      "org/gnome/shell".disable-user-extensions = false;
      "org/gnome/desktop/interface".clock-show-seconds = true;
      "org/gnome/desktop/interface".show-battery-percentage = true;
      "org/gnome/desktop/wm/preferences".button-layout = "close,minimize::";
      "org/gnome/desktop/peripherals/mouse".accel-profile = "flat";
      "org/gnome/desktop/privacy".remember-recent-files = false;
      "org/gnome/mutter".experimental-features = ["scale-monitor-framebuffer"];
      "org/gnome/mutter".dynamic-workspaces = true;
      "org/gnome/desktop/input-sources".xkb-options = ["compose:caps"];
      "org/gnome/shell".favorite-apps = [
        "firefox.desktop"
        "vesktop.desktop"
        "org.gnome.Nautilus.desktop"
        "com.mitchellh.ghostty.desktop"
        "com.mattjakeman.ExtensionManager.desktop"
        "org.gnome.Settings.desktop"
        "org.gnome.tweaks.desktop"
        "org.prismlauncher.PrismLauncher.desktop"
        "com.usebottles.bottles.desktop"
      ];
      "org/gnome/shell".enabled-extensions = with pkgs.gnomeExtensions; [
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
        color-picker.extensionUuid
      ];
      "org/gnome/shell/extensions/blur-my-shell/panel".blur = false;
      "org/gnome/shell/extensions/vitals" = {
        position-in-panel = 0;
        update-time = 1;
        show-temperature = false;
        show-voltage = false;
        show-fan = false;
        show-processor = false;
        show-storage = false;
        hot-sensors = "['__network-rx_max__', '_memory_available_', '_system_uptime_']";
      };
      "org/gnome/shell/extensions/runcat" = {
        displaying-items = "character-and-percentage";
        idle-threshold = 10;
      };
      "org/gnome/shell/extensions/mediacontrols" = {
        show-label = false;
        show-control-icons-seek-backward = false;
        show-control-icons-seek-forward = false;
        colored-player-icon = false;
        extension-position = "Left";
      };
      "org/gnome/shell/extensions/pano" = {
        paste-on-select = false;
        send-notification-on-copy = false;
        play-audio-on-copy = false;
        history-length = 200;
      };
      "org/gnome/shell/extensions/dash-to-dock" = {
        dock-position = "LEFT";
        extend-height = true;
        dock-fixed = true;
        show-apps-at-top = true;
        show-trash = false;
        show-mounts = false;
        click-action = "minimize-or-previews";
        running-indicator-style = "CILIORA";
        customize-alphas = true;
        min-alpha = 0.0;
        max-alpha = 1.0;
        custom-background-color = false;
      };
    };
    home.packages =
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
        color-picker
      ]);
  };
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
