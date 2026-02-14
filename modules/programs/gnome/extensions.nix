{inputs, ...}: {
  flake.modules = {
    nixos.gnome = {pkgs, ...}: {
      environment.systemPackages = with pkgs.gnomeExtensions; [
        dash-to-dock
        blur-my-shell
        gsconnect
        appindicator
        vitals
        quick-settings-audio-panel
        rounded-window-corners-reborn
        media-controls
        tiling-assistant
        runcat
        color-picker
        burn-my-windows
        gnome-40-ui-improvements
        simpleweather
        copyous
      ];
    };
    homeManager.gnome = {
      pkgs,
      config,
      ...
    }: {
      xdg.configFile."burn-my-windows/profiles/bmw.conf".source = inputs.self + /files/bmw.conf;
      dconf.settings = {
        "org/gnome/shell".enabled-extensions = with pkgs.gnomeExtensions; [
          user-themes.extensionUuid
          blur-my-shell.extensionUuid
          dash-to-dock.extensionUuid
          # gsconnect.extensionUuid
          appindicator.extensionUuid
          vitals.extensionUuid
          quick-settings-audio-panel.extensionUuid
          rounded-window-corners-reborn.extensionUuid
          media-controls.extensionUuid
          tiling-assistant.extensionUuid
          runcat.extensionUuid
          color-picker.extensionUuid
          burn-my-windows.extensionUuid
          gnome-40-ui-improvements.extensionUuid
          simpleweather.extensionUuid
          copyous.extensionUuid
        ];
        "org/gnome/shell/extensions/burn-my-windows".active-profile = "/home/${config.constants.username}/.config/burn-my-windows/profiles/bmw.conf";
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
      };
    };
  };
}
