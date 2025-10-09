{
  lib,
  config,
  ...
}: {
  config = lib.mkIf config.huncs.services.swww.enable {
    home-manager.users.hexfae.services.swww.enable = true;
  };
}
