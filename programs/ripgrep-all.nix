{
  lib,
  config,
  ...
}: {
  options.huncs.programs.ripgrep-all.enable = lib.mkOption {
    type = lib.types.bool;
    default = true;
  };

  config = lib.mkIf config.huncs.programs.ripgrep-all.enable {
    home-manager.users.hexfae.programs.ripgrep-all.enable = true;
  };
}
