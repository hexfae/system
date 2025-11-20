{
  lib,
  config,
  ...
}: {
  options.huncs.services.amberol.enable = lib.mkEnableOption "amberol";

  config = lib.mkIf config.huncs.services.amberol.enable {
    home-manager.users.hexfae.services.amberol.enable = true;
  };
}
