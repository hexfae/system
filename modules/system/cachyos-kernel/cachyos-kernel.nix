{inputs, ...}: {
  flake.modules.nixos.cachyos-kernel = {
    pkgs,
    config,
    ...
  }: {
    nixpkgs.overlays = [inputs.nix-cachyos-kernel.overlays.default];
    boot = {
      kernelPackages = pkgs.cachyosKernels.linuxPackages-cachyos-bore;
      zfs.package = config.boot.kernelPackages.zfs_cachyos;
    };
  };
}
