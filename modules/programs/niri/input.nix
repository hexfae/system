{
  flake.modules.homeManager.niri.programs.niri.settings.input = {
    focus-follows-mouse.enable = true;
    mouse.accel-profile = "flat";
    warp-mouse-to-focus = {
      enable = true;
      mode = "center-xy-always";
    };
    touchpad = {
      accel-profile = "flat";
      scroll-factor = 0.2;
    };
    keyboard = {
      repeat-delay = 300;
      repeat-rate = 40;
      xkb = {
        layout = "eu";
        options = "compose:caps";
      };
    };
  };
}
