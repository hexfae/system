{
  lib,
  config,
  vars,
  ...
}: {
  options.huncs.programs.tealdeer.enable = lib.mkOption {
    type = lib.types.bool;
    default = true;
  };

  config = lib.mkIf config.huncs.programs.tealdeer.enable {
    home-manager.users.${vars.username}.programs.tealdeer = {
      enable = true;
      settings.updates.auto_update = true;
    };
  };
}
