{
  lib,
  config,
  ...
}: {
  options.huncs.services.swww.enable = lib.mkEnableOption "swww";

  config = lib.mkIf config.huncs.services.swww.enable {
    home-manager.users.hexfae.services.swww.enable = true;
  };
}
