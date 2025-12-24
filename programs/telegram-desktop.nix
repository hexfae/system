{
  lib,
  config,
  pkgs,
  vars,
  ...
}: {
  options.huncs.programs.telegram-desktop.enable = lib.mkEnableOption "telegram";

  config = lib.mkIf config.huncs.programs.telegram-desktop.enable {
    home-manager.users.${vars.username}.home.packages = [pkgs.telegram-desktop];
  };
}
