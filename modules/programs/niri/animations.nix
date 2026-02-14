{
  flake.modules.homeManager.niri = {lib, ...}: {
    programs.niri.settings.animations = let
      triggers = [
        "config-notification-open-close"
        "exit-confirmation-open-close"
        "horizontal-view-movement"
        "overview-open-close"
        "screenshot-ui-open"
        "window-close"
        "window-movement"
        "window-open"
        "window-resize"
        "workspace-switch"
      ];
    in
      lib.genAttrs triggers (name: {
        kind.easing = {
          curve = "ease-out-expo";
          duration-ms = 500;
        };
      });
  };
}
