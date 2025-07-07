{
  pkgs,
  inputs,
  ...
}: {
  networking.networkmanager.enable = true;
  nixpkgs.overlays = [inputs.niri.overlays.niri];
  programs.niri = {
    package = pkgs.niri-unstable;
    enable = true;
  };
  services.dbus = {
    enable = true;
    implementation = "broker";
  };
  home-manager.users.hexfae = {config, ...}: {
    home.packages = with pkgs; [
      nautilus
      glib
    ];
    programs = {
      niriswitcher.enable = true;
      niri.settings = {
        spawn-at-startup = [{command = ["niriswitcher"];}];
        input = {
          keyboard = {
            repeat-delay = 300;
            xkb = {
              layout = "se";
              options = "compose:caps";
            };
          };
          touchpad = {
            accel-profile = "flat";
            scroll-factor = 0.2;
          };
        };
        binds = with config.lib.niri.actions; {
          "Mod+Return".action.spawn = "ghostty";
          "Mod+E".action.spawn = "nautilus";
          "Mod+W".action.spawn = "zen";
          "Alt+Tab" = {
            repeat = false;
            action.spawn = ["gdbus" "call" "--session" "--dest" "io.github.isaksamsten.Niriswitcher" "--object-path" "/io/github/isaksamsten/Niriswitcher" "--method" "io.github.isaksamsten.Niriswitcher.application"];
          };
          "Alt+Shift+Tab" = {
            repeat = false;
            action.spawn = ["gdbus" "call" "--session" "--dest" "io.github.isaksamsten.Niriswitcher" "--object-path" "/io/github/isaksamsten/Niriswitcher" "--method" "io.github.isaksamsten.Niriswitcher.application"];
          };
          "Mod+H".action = focus-column-or-monitor-left;
          "Mod+L".action = focus-column-or-monitor-right;
          "Mod+J".action = focus-window-or-workspace-down;
          "Mod+K".action = focus-window-or-workspace-up;
          "Mod+F".action = fullscreen-window;
          "Mod+Tab".action = toggle-overview;

          "Mod+Shift+E".action.quit.skip-confirmation = true;
        };
      };
    };
  };
}
