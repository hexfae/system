{pkgs, ...}: {
  system.stateVersion = "24.11";
  home-manager.users.hexfae.home.stateVersion = "24.11";

  # TODO: FIXME: attribute extend missing error?
  # boot.kernelPackages = pkgs.linuxPackages_cachyos-server;
  boot.kernelPackages = pkgs.linuxPackages;
  services.scx.enable = false;
  chaotic.mesa-git.enable = false;

  huncs.services = {
    harry.enable = true;
    nginx.enable = true;
  };
}
