{
  lib,
  config,
  ...
}: {
  config = lib.mkIf config.huncs.services.openrgb.enable {
    services.hardware.openrgb.enable = true;
  };
}
