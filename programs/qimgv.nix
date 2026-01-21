{
  lib,
  config,
  vars,
  pkgs,
  ...
}: {
  options.huncs.programs.qimgv.enable = lib.mkEnableOption "qimgv";

  config = lib.mkIf config.huncs.programs.qimgv.enable {
    home-manager.users.${vars.username}.home.packages = [pkgs.qimgv];
  };
}
