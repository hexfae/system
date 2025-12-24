{
  lib,
  config,
  vars,
  ...
}: {
  options.huncs.services.swww.enable = lib.mkEnableOption "swww";

  config = lib.mkIf config.huncs.services.swww.enable {
    home-manager.users.${vars.username}.services.swww.enable = true;
  };
}
