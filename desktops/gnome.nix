{
  pkgs,
  lib,
  config,
  inputs,
  vars,
  ...
}: let
  user = vars.username;
  isDesktop = config.networking.hostName == "desktop";
in {
  options.huncs.desktops.gnome.enable = lib.mkEnableOption "gnome";

  config = lib.mkIf config.huncs.desktops.gnome.enable {
    nixpkgs.overlays = [
      (final: prev: {
        gnomeExtensions =
          prev.gnomeExtensions
          // {
            copyous = prev.callPackage "${inputs.nixpkgs-copyous}/pkgs/desktops/gnome/extensions/copyous/default.nix" {};
          };
      })
    ];

    services = {
      displayManager.autoLogin.user = "${user}";
      libinput.mouse.accelProfile = "flat";
      displayManager.gdm.enable = true;
      desktopManager.gnome.enable = true;
      gnome.gnome-browser-connector.enable = true;
      dbus = {
        enable = true;
        implementation = "broker";
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
    home-manager.users.${user} = {lib, ...}: {
      programs.zen-browser.nativeMessagingHosts = [pkgs.gnome-browser-connector];
      xdg = {
        mimeApps = {
          defaultApplications = {
            "image/jpeg" = "org.gnome.Loupe.desktop";
            "image/png" = "org.gnome.Loupe.desktop";
            "x-scheme-handler/sms" = "org.gnome.Shell.Extensions.GSConnect.desktop";
            "x-scheme-handler/tel" = "org.gnome.Shell.Extensions.GSConnect.desktop";
          };
        };
        desktopEntries."org.gnome.Extensions" = {
          name = "Extensions";
          exec = "gnome-extensions-app";
          noDisplay = true;
        };
      };
      dconf.settings = {
        "org/gnome/shell".disable-user-extensions = false;
        "org/gnome/shell/keybindings" = {
          toggle-overview = ["<Super>Tab"];
          toggle-application-view = ["<Super>space"];
          focus-active-notification = [];
          toggle-message-tray = [];
          toggle-quick-settings = [];
        };
        "org/gnome/desktop/sound".theme-name = "ocean";
        "org/gnome/desktop/interface" = {
          clock-show-seconds = true;
          show-battery-percentage = true;
          font-hinting = "full";
          font-aliasing = "rgba";
        };
        "org/gnome/desktop/wm/keybindings" = {
          switch-windows = ["<Alt>Tab"];
          switch-windows-backward = ["<Shift><Alt>Tab"];
          move-to-monitor-left = ["<Shift><Super>h"];
          move-to-monitor-right = ["<Shift><Super>l"];
          move-to-workspace-left = ["<Shift><Super>k"];
          move-to-workspace-right = ["<Shift><Super>j"];
          move-to-workspace-1 = ["<Shift><Super>1"];
          move-to-workspace-2 = ["<Shift><Super>2"];
          move-to-workspace-3 = ["<Shift><Super>3"];
          move-to-workspace-4 = ["<Shift><Super>4"];
          switch-to-workspace-1 = ["<Super>1"];
          switch-to-workspace-2 = ["<Super>2"];
          switch-to-workspace-3 = ["<Super>3"];
          switch-to-workspace-4 = ["<Super>4"];
          switch-to-workspace-left = ["<Super>k"];
          switch-to-workspace-right = ["<Super>j"];
          close = ["<Super>q" "<Alt>F4"];
          toggle-maximized = ["<Super>f"];
          toggle-fullscreen = ["<Super><Shift>f"];
          switch-applications = [];
          switch-applications-backward = [];
          move-to-monitor-down = [];
          move-to-monitor-up = [];
          move-to-workspace-last = [];
          switch-panels = [];
          switch-panels-backward = [];
          cycle-panels = [];
          cycle-panels-backward = [];
          switch-to-workspace-last = [];
          cycle-group = [];
          cycle-group-backward = [];
          switch-group = [];
          switch-group-backward = [];
          panel-run-dialog = [];
          switch-input-source = [];
          switch-input-source-backward = [];
          activate-window-menu = [];
          minimize = [];
          maximize = [];
          begin-move = [];
          begin-resize = [];
        };
        "org/gnome/desktop/wm/preferences" = {
          button-layout = "close,minimize::";
          action-middle-click-titlebar = "minimize";
          resize-with-right-button = true;
          focus-mode = "sloppy";
        };
        "org/gnome/desktop/session".idle-delay = lib.hm.gvariant.mkUint32 0;
        "org/gnome/desktop/peripherals/mouse".accel-profile = "flat";
        "org/gnome/desktop/peripherals/touchpad".accel-profile = "flat";
        "org/gnome/desktop/privacy".remember-recent-files = false;
        "org/gnome/mutter" = {
          experimental-features = ["scale-monitor-framebuffer"];
          focus-change-on-pointer-rest = false;
        };
        "org/gnome/mutter/wayland/keybindings".restore-shortcuts = [];
        "org/gnome/mutter".dynamic-workspaces = true;
        "org/gnome/desktop/input-sources" = {
          xkb-options = ["compose:caps"];
          sources = [(lib.hm.gvariant.mkTuple ["xkb" "se"])];
        };
        "org/gnome/settings-daemon/plugins/media-keys" = {
          home = ["<Super>e"];
          www = ["<Super>w"];
          play = ["<Shift><Super>p"];
          previous = ["<Shift><Super>Left"];
          next = ["<Shift><Super>Right"];
          help = [];
          screenreader = [];
          magnifier = [];
          magnifier-zoom-in = [];
          magnifier-zoom-out = [];
          logout = [];
          screensaver = [];
        };
        "org/gnome/settings-daemon/plugins/media-keys".custom-keybindings = [
          "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/"
        ];
        "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0" = {
          binding = "<Super>Return";
          command = "ghostty";
          name = "Launch Ghostty";
        };
        "org/gnome/settings-daemon/plugins/power" = {
          idle-dim = false;
          sleep-inactive-battery-type = "nothing";
          sleep-inactive-ac-type = "nothing";
        };
        "org/gnome/shell".favorite-apps = [
          "zen-twilight.desktop"
          "discord-canary.desktop"
          "org.telegram.desktop.desktop"
          "org.gnome.Nautilus.desktop"
          "com.mitchellh.ghostty.desktop"
          "org.gnome.Settings.desktop"
        ];
        "org/gnome/shell".enabled-extensions = with pkgs.gnomeExtensions; [
          user-themes.extensionUuid
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
          burn-my-windows.extensionUuid
          # smart-home.extensionUuid
          color-picker.extensionUuid
          gnome-40-ui-improvements.extensionUuid
          simpleweather.extensionUuid
          copyous.extensionUuid
        ];
        "org/gnome/shell/extensions/burn-my-windows".active-profile = "/home/${user}/.config/burn-my-windows/profiles/bmw.conf";
        "org/gnome/shell/extensions/blur-my-shell/panel".blur = false;
        "org/gnome/shell/extensions/blur-my-shell/dash-to-dock".blur = false;
        "org/gnome/shell/extensions/vitals" = {
          position-in-panel = 0;
          update-time = 1;
          show-temperature = false;
          show-voltage = false;
          show-fan = false;
          show-processor = false;
          show-storage = false;
          hot-sensors = ["_system_uptime_" "_memory_available_" "__network-rx_max__"];
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
          extension-position = "Center";
        };
        "org/gnome/shell/extensions/pano" = {
          paste-on-select = false;
          send-notification-on-copy = false;
          play-audio-on-copy = false;
          history-length = 200;
        };
        "org/gnome/shell/extensions/simple-weather" = {
          locations = ["{\"name\":\"Luleå\",\"lat\":65.619023,\"lon\":22.1471079}"];
          main-location-index = 0;
          panel-box = "center";
        };
        "org/gnome/shell/extensions/dash-to-dock" = {
          dock-position = "LEFT";
          extend-height = true;
          dock-fixed = true;
          show-apps-at-top = true;
          show-trash = false;
          show-mounts = false;
          custom-theme-shrink = true;
          click-action = "minimize-or-previews";
          transparency-mode = "DYNAMIC";
          running-indicator-style = "CILIORA";
          customize-alphas = true;
          min-alpha = 0.0;
          max-alpha = 1.0;
          custom-background-color = true;
          background-color = "rgb(41,44,60)";
        };
        "org/gnome/nautilus/preferences" = {
          show-create-link = true;
          show-delete-permanently = true;
          date-time-format = "detailed";
        };
        "org/gnome/nautilus/icon-view".captions = ["size" "none" "none"];
      };
      xdg.configFile = {
        "burn-my-windows/profiles/bmw.conf".source = ../files/bmw.conf;
        "monitors.xml" = lib.mkIf isDesktop {
          source = ../files/monitors.xml;
          force = true;
        };
      };
      home.packages =
        (with pkgs; [
          refine
          gnome-extension-manager
          fragments
          adwsteamgtk
          resources
          kdePackages.ocean-sound-theme
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
          burn-my-windows
          # smart-home
          color-picker
          gnome-40-ui-improvements
          simpleweather
          copyous
        ]);
    };
    # https://wiki.nixos.org/wiki/GNOME#Excluding_GNOME_Applications
    environment.gnome.excludePackages = with pkgs; [
      orca # screen reader
      evince # document viewer
      file-roller # archive manager
      geary # mail client
      seahorse # keyring manager
      sushi # file previewer
      sysprof # system profiler
      adwaita-icon-theme
      baobab # disk analyzer
      epiphany # web browser
      simple-scan # document scanner
      snapshot # camera app
      totem # video player
      yelp # help app
      papers # document viewer
      gnome-disk-utility
      gnome-shell-extensions
      gnome-backgrounds
      gnome-color-manager
      gnome-tour
      gnome-user-docs
      gnome-text-editor
      gnome-calculator
      gnome-calendar
      gnome-characters
      gnome-clocks
      gnome-console
      gnome-contacts
      gnome-font-viewer
      gnome-logs
      gnome-maps
      gnome-music
      gnome-system-monitor
      gnome-weather
      gnome-connections
      gnome-themes-extra
    ];
  };
}
