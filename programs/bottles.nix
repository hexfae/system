{
  lib,
  config,
  pkgs,
  vars,
  ...
}: {
  options.huncs.programs.bottles.enable = lib.mkEnableOption "bottles";

  config = lib.mkIf config.huncs.programs.bottles.enable {
    home-manager.users.${vars.username}.home.packages = [(pkgs.bottles.override {removeWarningPopup = true;})];
  };
}
