{
  lib,
  config,
  pkgs,
  ...
}: {
  options.huncs.programs.telegram-desktop.enable = lib.mkEnableOption "telegram";

  config = lib.mkIf config.huncs.programs.telegram-desktop.enable {
    home-manager.users.hexfae.home.packages = [pkgs.telegram-desktop];
  };
}
