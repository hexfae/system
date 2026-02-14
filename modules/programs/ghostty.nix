{inputs, ...}: {
  flake.modules = {
    nixos.ghostty = {pkgs, ...}: {
      home-manager.sharedModules = [inputs.self.modules.homeManager.ghostty];
      environment.variables.TERMINAL = pkgs.ghostty + /bin/ghostty;
    };
    homeManager.ghostty = {pkgs, ...}: {
      programs.ghostty.enable = true;
      xdg.mimeApps.defaultApplications."x-terminal-emulator" = "com.mitchellh.ghostty.desktop";
      dconf.settings."org/gnome/desktop/applications/terminal".exec = pkgs.ghostty + /bin/ghostty;
    };
  };
}
