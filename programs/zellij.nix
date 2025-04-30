{...}: {
  home-manager.users.hexfae.programs.zellij = {
    enable = true;
    settings = {
      default_shell = "nu";
      mouse_mode = false;
      ui.pane_frames.rounded_corners = true;
      ui.pane_frames.hide_session_name = true;
    };
  };
}
