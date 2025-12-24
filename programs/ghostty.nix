{
  lib,
  config,
  vars,
  ...
}: {
  options.huncs.programs.ghostty.enable = lib.mkEnableOption "ghostty";

  config = lib.mkIf config.huncs.programs.ghostty.enable {
    home-manager.users.${vars.username} = {
      xdg.mimeApps.defaultApplications."x-terminal-emulator" = "com.mitchellh.ghostty.desktop";
      programs.ghostty = {
        enable = true;
        installBatSyntax = true;
      };
    };
  };
}
