{
  flake.modules.homeManager.niri = {
    pkgs,
    config,
    ...
  }: {
    programs.niri.settings.binds = with config.lib.niri.actions; {
      "Mod+Return".action.spawn = ["${pkgs.ghostty}/bin/ghostty" "+new-window"];
      # TODO: add +new-window: https://github.com/ghostty-org/ghostty/issues/8862
      "Mod+E".action.spawn = ["${pkgs.ghostty}/bin/ghostty" "-e" "${pkgs.yazi}/bin/yazi"];
      # "Mod+Space".action.spawn = ["${pkgs.netcat}/bin/nc" "-U" "/run/user/1000/walker/walker.sock"];
      "Mod+Space".action.spawn = ["noctalia-shell" "ipc" "call" "launcher" "toggle"];

      "Mod+F".action = maximize-column;
      "Mod+Shift+F".action = fullscreen-window;
      "Mod+Q".action = close-window;
      "Mod+R".action = switch-preset-column-width;
      "Mod+Tab".action = toggle-overview;
      "Mod+T".action = toggle-column-tabbed-display;
      "Mod+Shift+E".action.quit.skip-confirmation = true;

      "Print".action.screenshot = [];

      "Mod+H".action = focus-column-or-monitor-left;
      "Mod+L".action = focus-column-or-monitor-right;
      "Mod+J".action = focus-window-or-workspace-down;
      "Mod+K".action = focus-window-or-workspace-up;
      "Mod+Control+H".action = focus-monitor-left;
      "Mod+Control+L".action = focus-monitor-right;
      "Mod+Shift+H".action = move-column-left-or-to-monitor-left;
      "Mod+Shift+L".action = move-column-right-or-to-monitor-right;
      "Mod+Shift+J".action = move-window-down-or-to-workspace-down;
      "Mod+Shift+K".action = move-window-up-or-to-workspace-up;
      "Mod+Control+Shift+H".action = move-window-to-monitor-left;
      "Mod+Control+Shift+L".action = move-window-to-monitor-right;

      "Mod+A".action = focus-column-or-monitor-left;
      "Mod+D".action = focus-column-or-monitor-right;
      "Mod+S".action = focus-window-or-workspace-down;
      "Mod+W".action = focus-window-or-workspace-up;
      "Mod+Control+A".action = focus-monitor-left;
      "Mod+Control+D".action = focus-monitor-right;
      "Mod+Shift+A".action = move-column-left-or-to-monitor-left;
      "Mod+Shift+D".action = move-column-right-or-to-monitor-right;
      "Mod+Shift+S".action = move-window-down-or-to-workspace-down;
      "Mod+Shift+W".action = move-window-up-or-to-workspace-up;
      "Mod+Control+Shift+A".action = move-window-to-monitor-left;
      "Mod+Control+Shift+D".action = move-window-to-monitor-right;

      "Mod+Left".action = focus-column-or-monitor-left;
      "Mod+Right".action = focus-column-or-monitor-right;
      "Mod+Down".action = focus-window-or-workspace-down;
      "Mod+Up".action = focus-window-or-workspace-up;
      "Mod+Control+Left".action = focus-monitor-left;
      "Mod+Control+Right".action = focus-monitor-right;
      "Mod+Shift+Left".action = move-column-left-or-to-monitor-left;
      "Mod+Shift+Right".action = move-column-right-or-to-monitor-right;
      "Mod+Shift+Down".action = move-window-down-or-to-workspace-down;
      "Mod+Shift+Up".action = move-window-up-or-to-workspace-up;
      "Mod+Control+Shift+Left".action = move-window-to-monitor-left;
      "Mod+Control+Shift+Right".action = move-window-to-monitor-right;
    };
  };
}
