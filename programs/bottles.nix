{
  lib,
  config,
  pkgs,
  ...
}: {
  options.huncs.programs.bottles.enable = lib.mkEnableOption "bottles";

  config = lib.mkIf config.huncs.programs.bottles.enable {
    home-manager.users.hexfae.home.packages = [(pkgs.bottles.override {removeWarningPopup = true;})];
  };
}
