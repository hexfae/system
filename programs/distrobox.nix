{
  lib,
  config,
  pkgs,
  vars,
  ...
}: {
  options.huncs.programs.distrobox.enable = lib.mkEnableOption "distrobox";

  config = lib.mkIf config.huncs.programs.distrobox.enable {
    virtualisation.podman = {
      enable = true;
      dockerCompat = true;
    };

    home-manager.users.${vars.username}.home.packages = [pkgs.distrobox];
  };
}
