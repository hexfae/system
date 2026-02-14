{inputs, ...}: {
  flake.modules = {
    nixos.gnome = {
      pkgs,
      config,
      ...
    }: {
      home-manager.sharedModules = [inputs.self.modules.homeManager.gnome];
      services = {
        libinput.mouse.accelProfile = "flat";
        desktopManager.gnome.enable = true;
        displayManager = {
          autoLogin.user = config.constants.username;
          gdm.enable = true;
        };
        dbus = {
          enable = true;
          implementation = "broker";
          packages = [pkgs.gnome-browser-connector];
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
    };
    homeManager.gnome = {
      pkgs,
      lib,
      config,
      osConfig,
      ...
    }: {
      programs.zen-browser.profiles.${config.constants.username}.extensions.packages = [pkgs.nur.repos.rycee.firefox-addons.gnome-shell-integration];
      xdg.configFile."burn-my-windows/profiles/bmw.conf".source = inputs.self + /files/bmw.conf;
      home = {
        activation = lib.mkIf osConfig.programs.steam.enable {
          applyAdwaitaSteam = lib.hm.dag.entryAfter ["writeBoundary"] ''
            ${pkgs.adwsteamgtk}/bin/adwaita-steam-gtk --install --options "color_theme:catpuccin-frappe;rounded_corners:true"
          '';
        };
        packages = with pkgs; [
          resources
          kdePackages.ocean-sound-theme
          gnome-browser-connector
        ];
      };
      dconf.settings = {
        "org/gnome/shell".disable-user-extensions = false;
        "org/gnome/desktop/sound".theme-name = "ocean";
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
        "org/gnome/settings-daemon/plugins/power" = {
          idle-dim = false;
          sleep-inactive-battery-type = "nothing";
          sleep-inactive-ac-type = "nothing";
        };
        "org/gnome/settings-daemon/plugins/housekeeping".donation-reminder-enabled = false;
        "org/gnome/shell".favorite-apps = [
          "zen-twilight.desktop"
          "discord-canary.desktop"
          "org.telegram.desktop.desktop"
          "com.mitchellh.ghostty.desktop"
        ];
        "org/gnome/nautilus/preferences" = {
          show-create-link = true;
          show-delete-permanently = true;
          date-time-format = "detailed";
        };
        "org/gnome/nautilus/icon-view".captions = ["size" "none" "none"];
      };
    };
  };
}
