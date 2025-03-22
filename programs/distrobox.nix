{pkgs, ...}: {
  virtualisation.podman.enable = true;
  virtualisation.podman.dockerCompat = true;
  home-manager.users.hexfae.home.packages = [pkgs.distrobox];
}
