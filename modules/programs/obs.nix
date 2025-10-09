{
  lib,
  config,
  ...
}: {
  config = lib.mkIf config.huncs.programs.obs.enable {
    programs.obs-studio = {
      enable = true;
      enableVirtualCamera = true;
    };
  };
}
