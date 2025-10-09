{
  lib,
  config,
  ...
}: {
  config = lib.mkIf config.huncs.programs.vesktop.enable {
    home-manager.users.hexfae.programs.vesktop.enable = true;
  };
}
