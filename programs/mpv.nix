{
  pkgs,
  lib,
  config,
  vars,
  ...
}: {
  options.huncs.programs.mpv.enable = lib.mkEnableOption "mpv";

  config = lib.mkIf config.huncs.programs.mpv.enable {
    home-manager.users.${vars.username}.programs.mpv = {
      enable = true;
      package = pkgs.mpv-vapoursynth;
    };
  };
}
