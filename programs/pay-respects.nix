{
  lib,
  config,
  vars,
  ...
}: {
  options.huncs.programs.pay-respects.enable = lib.mkOption {
    type = lib.types.bool;
    default = true;
  };

  config = lib.mkIf config.huncs.programs.pay-respects.enable {
    home-manager.users.${vars.username}.programs.pay-respects = {
      enable = true;
      enableNushellIntegration = true;
    };
  };
}
