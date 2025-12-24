{
  lib,
  config,
  vars,
  ...
}: {
  options.huncs.programs.zoxide.enable = lib.mkOption {
    type = lib.types.bool;
    default = true;
  };

  config = lib.mkIf config.huncs.programs.zoxide.enable {
    home-manager.users.${vars.username}.programs.zoxide = {
      enable = true;
      enableNushellIntegration = true;
    };
  };
}
