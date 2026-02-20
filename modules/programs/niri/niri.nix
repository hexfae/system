{inputs, ...}: {
  flake.modules = {
    nixos.niri = {
      pkgs,
      config,
      ...
    }: {
      boot = {
        kernelParams = [
          "video=DP-2:1920x1080@144"
          "video=HDMI-A-2:1920x1080@75"
          "video=HDMI-A-1:1920x1080@60"
          "split_lock_detect=off"
        ];
      };

      # https://github.com/niri-wm/niri/wiki/Application-Issues#gtk-4-dead-keys--compose
      environment.variables.GTK_IM_MODULE = "simple";

      imports = [inputs.niri-flake.nixosModules.niri];
      home-manager.sharedModules = [inputs.self.modules.homeManager.niri];
      nixpkgs.overlays = [inputs.niri-flake.overlays.niri];
      hardware.bluetooth.enable = true;
      services.resolved.enable = true;
      programs.niri = {
        package = pkgs.niri-unstable;
        enable = true;
      };
      services = {
        blueman.enable = true;
        getty.autologinUser = config.constants.username;
        dbus = {
          enable = true;
          implementation = "broker";
        };
      };
    };
    homeManager.niri = {
      pkgs,
      lib,
      config,
      ...
    }: {
      dconf.settings."org/gnome/desktop/wm/preferences".button-layout = "close::";
      home.packages = [pkgs.pavucontrol];
      programs = {
        niri.settings = {
          hotkey-overlay.skip-at-startup = true;
          clipboard.disable-primary = true;
          screenshot-path = "~/pix/Screenshots/Screenshot from %Y-%m-%d %H-%M-%S.png";
          xwayland-satellite.path = "${pkgs.xwayland-satellite}/bin/xwayland-satellite";
          # cursor = {
          #   hide-after-inactive-ms = 5000;
          #   hide-when-typing = true;
          # };
          layout = {
            gaps = 8;
            shadow.enable = true;
            always-center-single-column = true;
            empty-workspace-above-first = true;
            center-focused-column = "on-overflow";
            preset-column-widths = [
              {proportion = 1. / 3.;}
              {proportion = .5;}
              {proportion = 2. / 3.;}
            ];
          };
          window-rules = [
            {
              clip-to-geometry = true;
              geometry-corner-radius = {
                top-left = 16.0;
                top-right = 16.0;
                bottom-right = 16.0;
                bottom-left = 16.0;
              };
            }
          ];
        };
      };
    };
  };
}
