{
  lib,
  config,
  ...
}: {
  options.huncs.programs.obs-studio.enable = lib.mkEnableOption "obs-studio";

  config = lib.mkIf config.huncs.programs.obs-studio.enable {
    programs.obs-studio = {
      enable = true;
      enableVirtualCamera = true;
    };
  };
}
