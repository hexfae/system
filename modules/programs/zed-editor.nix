{
  lib,
  config,
  ...
}: {
  config = lib.mkIf config.huncs.programs.zed-editor.enable {
    home-manager.users.hexfae.programs.zed-editor.enable = true;
  };
}
