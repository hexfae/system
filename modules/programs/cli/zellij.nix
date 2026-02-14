{
  flake.modules.homeManager.zellij = {
    lib,
    config,
    vars,
    ...
  }: {
    programs.zellij = {
      enable = true;
      settings = {
        default_shell = "nu";
        mouse_mode = false;
        ui.pane_frames = {
          rounded_corners = true;
          hide_session_name = true;
        };
      };
    };
  };
}
