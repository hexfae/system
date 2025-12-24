{
  pkgs,
  inputs,
  lib,
  config,
  vars,
  ...
}: let
  image = pkgs.fetchurl {
    url = "https://w.wallhaven.cc/full/k8/wallhaven-k898gq.jpg";
    sha256 = "sha256-BjREdU8AqHatcnVdpGE09kPrQTTt1mIagiHfLRSxPVw=";
  };
  blurred-image = pkgs.runCommand "blurred-wallpaper.png" {} ''
    ${lib.getExe' pkgs.imagemagick "magick"} "${image}" -blur 0x8 $out
  '';
in {
  options.huncs.desktops.niri.enable = lib.mkEnableOption "niri";

  config = lib.mkIf config.huncs.desktops.niri.enable {
    huncs = {
      programs.waybar.enable = true;
      services = {
        pipewire.enable = true;
        swww.enable = true;
      };
    };

    services.getty.autologinUser = "${vars.username}";
    hardware.bluetooth.enable = true;
    networking.networkmanager.enable = true;
    services.blueman.enable = true;
    nixpkgs.overlays = [inputs.niri.overlays.niri];
    programs.niri = {
      package = pkgs.niri-unstable;
      enable = true;
    };
    services.dbus = {
      enable = true;
      implementation = "broker";
    };
    home-manager.users.${vars.username} = {config, ...}: {
      dconf.settings."org/gnome/desktop/wm/preferences".button-layout = "close::";
      services.mako.enable = true;
      home.packages = with pkgs; [
        glib
        nautilus
        swww
        swaybg
        xwayland-satellite
        pavucontrol
        albert
      ];
      programs = {
        niriswitcher.enable = true;
        niri.settings = {
          hotkey-overlay.skip-at-startup = true;
          clipboard.disable-primary = true;
          layer-rules = [
            {
              matches = [
                {
                  namespace = "^wallpaper$";
                }
              ];
              place-within-backdrop = true;
            }
          ];
          layout = {
            gaps = 8;
            preset-column-widths = [
              {proportion = 1. / 3.;}
              {proportion = .5;}
              {proportion = 2. / 3.;}
            ];
          };
          window-rules = [
            {
              geometry-corner-radius = {
                top-left = 16.0;
                top-right = 16.0;
                bottom-right = 16.0;
                bottom-left = 16.0;
              };
              clip-to-geometry = true;
            }
          ];
          spawn-at-startup = [
            {command = ["niriswitcher"];}
            {command = ["albert"];}
            {command = ["swww" "img" "${image}"];}
            {command = ["swaybg" "--image" "${blurred-image}"];}
            {command = ["systemctl" "start" "--user" "app-com.mitchellh.ghostty.service"];}
          ];
          input = {
            keyboard = {
              repeat-delay = 300;
              xkb = {
                layout = "se";
                options = "compose:caps";
              };
            };
            mouse.accel-profile = "flat";
            focus-follows-mouse.enable = true;
            warp-mouse-to-focus = {
              enable = true;
              mode = "center-xy-always";
            };
            touchpad = {
              accel-profile = "flat";
              scroll-factor = 0.2;
            };
          };
          outputs = {
            "eDP-1" = {
              scale = 1.0;
            };
            "DP-2" = {
              variable-refresh-rate = true;
              focus-at-startup = true;
              mode = {
                width = 1920;
                height = 1080;
                refresh = 143.999;
              };
              position = {
                x = 0;
                y = 0;
              };
            };
            "HDMI-A-1" = {
              position = {
                x = -1920;
                y = 30;
              };
            };
            "HDMI-A-2" = {
              mode = {
                width = 1920;
                height = 1080;
                refresh = 74.986;
              };
              position = {
                x = 1920;
                y = 40;
              };
            };
          };
          binds = with config.lib.niri.actions; {
            "Mod+Return".action.spawn = ["ghostty" "+new-window"];
            "Mod+E".action.spawn = "nautilus";
            "Mod+W".action.spawn = "zen";
            "Mod+D".action.spawn = ["discordcanary" "--ozone-platform=wayland"];
            "Mod+Space".action.spawn = ["albert" "toggle"];

            "Alt+Tab" = {
              repeat = false;
              action.spawn = ["gdbus" "call" "--session" "--dest" "io.github.isaksamsten.Niriswitcher" "--object-path" "/io/github/isaksamsten/Niriswitcher" "--method" "io.github.isaksamsten.Niriswitcher.application"];
            };
            "Alt+Shift+Tab" = {
              repeat = false;
              action.spawn = ["gdbus" "call" "--session" "--dest" "io.github.isaksamsten.Niriswitcher" "--object-path" "/io/github/isaksamsten/Niriswitcher" "--method" "io.github.isaksamsten.Niriswitcher.application"];
            };

            "Print".action = screenshot;

            "Mod+H".action = focus-column-or-monitor-left;
            "Mod+L".action = focus-column-or-monitor-right;
            "Mod+J".action = focus-window-or-workspace-down;
            "Mod+K".action = focus-window-or-workspace-up;

            "Mod+Shift+H".action = move-column-left-or-to-monitor-left;
            "Mod+Shift+L".action = move-column-right-or-to-monitor-right;
            "Mod+Shift+J".action = move-window-down-or-to-workspace-down;
            "Mod+Shift+K".action = move-window-up-or-to-workspace-up;

            "Mod+F".action = maximize-column;
            "Mod+Shift+F".action = fullscreen-window;
            "Mod+Q".action = close-window;
            "Mod+R".action = switch-preset-column-width;
            "Mod+Tab".action = toggle-overview;
            "Mod+T".action = toggle-column-tabbed-display;

            "Mod+Shift+E".action.quit.skip-confirmation = true;
          };
        };
      };
    };
  };
}
