{
  lib,
  config,
  ...
}: {
  options.huncs.programs.nix-direnv.enable = lib.mkOption {
    type = lib.types.bool;
    default = true;
  };

  config = lib.mkIf config.huncs.programs.nix-direnv.enable {
    home-manager.users.hexfae.programs.direnv = {
      enable = true;
      enableNushellIntegration = true;
      silent = true;
      nix-direnv.enable = true;
    };
  };
}
