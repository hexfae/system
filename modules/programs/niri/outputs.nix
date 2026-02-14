{
  flake.modules.homeManager.niri.programs.niri.settings.outputs = {
    # laptop built-in display
    "eDP-1" = {
      scale = 1.0;
    };
    # desktop main
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
    # desktop left monitor
    "HDMI-A-1" = {
      position = {
        x = -1920;
        y = 30;
      };
    };
    # desktop right monitor
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
}
