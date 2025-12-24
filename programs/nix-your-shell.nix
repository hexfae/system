{
  lib,
  config,
  vars,
  ...
}: {
  options.huncs.programs.nix-your-shell.enable = lib.mkOption {
    type = lib.types.bool;
    default = true;
  };

  config = lib.mkIf config.huncs.programs.nix-your-shell.enable {
    home-manager.users.${vars.username}.programs.nix-your-shell = {
      enable = true;
      enableNushellIntegration = true;
    };
  };
}
