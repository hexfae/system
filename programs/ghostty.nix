{...}: {
  home-manager.users.hexfae = {
    programs.ghostty = {
      enable = true;
      installBatSyntax = true;
    };
    xdg.mimeApps.defaultApplications."x-terminal-emulator" = "com.mitchellh.ghostty.desktop";
  };
}
