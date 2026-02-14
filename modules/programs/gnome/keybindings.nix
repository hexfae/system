{
  flake.modules.homeManager.gnome.dconf.settings = {
    "org/gnome/settings-daemon/plugins/media-keys".custom-keybindings = [
      "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/"
    ];
    "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0" = {
      binding = "<Super>Return";
      command = "ghostty";
      name = "Launch Ghostty";
    };
    "org/gnome/shell/keybindings" = {
      toggle-overview = ["<Super>Tab"];
      toggle-application-view = ["<Super>space"];
      focus-active-notification = [];
      toggle-message-tray = [];
      toggle-quick-settings = [];
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
  };
}
