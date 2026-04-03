{
  flake.modules.nixos.zfs = {
    pkgs,
    lib,
    ...
  }: {
    services.zfs.autoScrub.enable = true;
    # TODO: services.zfs.expandOnBoot
    boot.supportedFilesystems.zfs = true;
    boot.zfs.package = lib.mkDefault pkgs.zfs_unstable;
  };
}
