{
  flake.modules.nixos.zfs = {pkgs, ...}: {
    services.zfs.autoScrub.enable = true;
    # TODO: services.zfs.expandOnBoot
    boot.zfs.package = pkgs.zfs_unstable;
  };
}
