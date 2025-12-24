{
  lib,
  config,
  vars,
  ...
}: {
  options.huncs.programs.zellij.enable = lib.mkOption {
    type = lib.types.bool;
    default = true;
  };

  config = lib.mkIf config.huncs.programs.zellij.enable {
    home-manager.users.${vars.username}.programs.zellij = {
      enable = true;
      settings = {
        default_shell = "nu";
        mouse_mode = false;
        ui.pane_frames.rounded_corners = true;
        ui.pane_frames.hide_session_name = true;
      };
    };
  };
}
