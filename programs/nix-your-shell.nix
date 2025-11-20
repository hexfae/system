{
  lib,
  config,
  ...
}: {
  options.huncs.programs.nix-your-shell.enable = lib.mkOption {
    type = lib.types.bool;
    default = true;
  };

  config = lib.mkIf config.huncs.programs.nix-your-shell.enable {
    home-manager.users.hexfae.programs.nix-your-shell = {
      enable = true;
      enableNushellIntegration = true;
    };
  };
}
