{
  lib,
  config,
  ...
}: {
  config = lib.mkIf config.huncs.programs.ghostty.enable {
    home-manager.users.hexfae = {
      programs.ghostty = {
        enable = true;
        installBatSyntax = true;
      };
      xdg.mimeApps.defaultApplications."x-terminal-emulator" = "com.mitchellh.ghostty.desktop";
    };
  };
}
