{
  lib,
  config,
  vars,
  ...
}: {
  options.huncs.programs.jujutsu.enable = lib.mkOption {
    type = lib.types.bool;
    default = true;
  };

  config = lib.mkIf config.huncs.programs.jujutsu.enable {
    home-manager.users.${vars.username}.programs.jujutsu = {
      enable = true;
      settings.user = {
        name = "hexfae";
        email = "hexfae@proton.me";
      };
    };
  };
}
