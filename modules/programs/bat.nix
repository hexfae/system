{
  lib,
  config,
  ...
}: {
  config = lib.mkIf config.huncs.programs.bat.enable {
    home-manager.users.hexfae.programs.bat.enable = true;
  };
}
