{...}: {
  home-manager.users.hexfae.programs.zellij.enable = true;
  home-manager.users.hexfae.programs.zellij.settings.default_shell = "nu";
  home-manager.users.hexfae.programs.zellij.settings.mouse_mode = false;
  home-manager.users.hexfae.programs.zellij.settings.ui.pane_frames.rounded_corners = true;
  home-manager.users.hexfae.programs.zellij.settings.ui.pane_frames.hide_session_name = true;
}
