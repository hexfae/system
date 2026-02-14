{
  flake.modules.nixos.xanmod-kernel = {pkgs, ...}: {
    boot.kernelPackages = pkgs.linuxPackages_xanmod_latest;
  };
}
