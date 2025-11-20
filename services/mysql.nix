{
  lib,
  config,
  pkgs,
  ...
}: {
  options.huncs.services.mysql.enable = lib.mkEnableOption "mysql";

  config = lib.mkIf config.huncs.services.mysql.enable {
    services.mysql = {
      enable = true;
      package = pkgs.mariadb;
    };
  };
}
