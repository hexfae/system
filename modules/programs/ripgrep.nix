{
  lib,
  config,
  ...
}: {
  config = lib.mkIf config.huncs.programs.ripgrep-all.enable {
    home-manager.users.hexfae.programs.ripgrep-all.enable = true;
  };
}
