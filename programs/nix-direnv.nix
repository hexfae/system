{
  lib,
  config,
  vars,
  ...
}: {
  options.huncs.programs.nix-direnv.enable = lib.mkOption {
    type = lib.types.bool;
    default = true;
  };

  config = lib.mkIf config.huncs.programs.nix-direnv.enable {
    home-manager.users.${vars.username}.programs.direnv = {
      enable = true;
      enableNushellIntegration = true;
      silent = true;
      nix-direnv.enable = true;
    };
  };
}
