{
  pkgs,
  lib,
  config,
  ...
}: {
  config = lib.mkIf config.huncs.programs.distrobox.enable {
    virtualisation.podman.enable = true;
    virtualisation.podman.dockerCompat = true;
    home-manager.users.hexfae.home.packages = [pkgs.distrobox];
  };
}
