{
  lib,
  config,
  vars,
  ...
}: {
  options.huncs.services.amberol.enable = lib.mkEnableOption "amberol";

  config = lib.mkIf config.huncs.services.amberol.enable {
    home-manager.users.${vars.username}.services.amberol.enable = true;
  };
}
