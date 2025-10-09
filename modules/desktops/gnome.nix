{
  pkgs,
  lib,
  config,
  ...
}: {
  config = lib.mkIf config.huncs.desktops.gnome.enable {
    services = {
      displayManager.autoLogin.user = "hexfae";
      libinput.mouse.accelProfile = "flat";
      flatpak.enable = true;
      displayManager.gdm.enable = true;
      desktopManager.gnome.enable = true;
      dbus = {
        enable = true;
        implementation = "broker";
      };
      xserver.excludePackages = [pkgs.xterm];
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
    home-manager.users.hexfae = {lib, ...}: {
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
      };
      dconf.settings = {
        "org/gnome/shell".disable-user-extensions = false;
        "org/gnome/desktop/interface" = {
          clock-show-seconds = true;
          show-battery-percentage = true;
          font-hinting = "full";
          font-aliasing = "rgba";
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
        "org/gnome/mutter".experimental-features = ["scale-monitor-framebuffer"];
        "org/gnome/mutter".dynamic-workspaces = true;
        "org/gnome/desktop/input-sources".xkb-options = ["compose:caps"];
        "org/gnome/tweaks".show-extensions-notice = false;
        "org/gnome/settings-daemon/plugins/power" = {
          idle-dim = false;
          sleep-inactive-battery-type = "nothing";
          sleep-inactive-ac-type = "nothing";
        };
        "org/gnome/shell".favorite-apps = [
          "zen-twilight.desktop"
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
          kando-integration.extensionUuid
          # smart-home.extensionUuid
          color-picker.extensionUuid
          # TODO: add https://github.com/romanlefler/SimpleWeather when available on nixpkgs
        ];
        "org/gnome/shell/extensions/burn-my-windows".active-profile = "/home/hexfae/.config/burn-my-windows/profiles/bmw.conf";
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
          custom-theme-shrink = true;
          click-action = "minimize-or-previews";
          transparency-mode = "DYNAMIC";
          running-indicator-style = "CILIORA";
          customize-alphas = true;
          min-alpha = 0.0;
          max-alpha = 1.0;
          custom-background-color = true;
          background-color = "rgb(53,59,69)";
        };
      };
      home.file."/home/hexfae/.config/burn-my-windows/profiles/bmw.conf".text = "[burn-my-windows-profile]
      fire-enable-effect=false
      glide-enable-effect=true
      tv-enable-effect=true";
      home.packages =
        (with pkgs; [
          gnome-tweaks
          gnome-extension-manager
          kando
          amberol
          video-trimmer
          adwsteamgtk
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
          kando-integration
          # smart-home
          color-picker
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
