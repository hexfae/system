{
  lib,
  config,
  ...
}: {
  options.huncs.programs.yazi.enable = lib.mkOption {
    type = lib.types.bool;
    default = true;
  };

  config = lib.mkIf config.huncs.programs.yazi.enable {
    home-manager.users.hexfae = {
      xdg.desktopEntries."yazi" = {
        name = "Yazi";
        exec = "yazi %u";
        noDisplay = true;
      };
      programs.yazi = {
        enable = true;
        enableNushellIntegration = true;
      };
    };
  };
}
