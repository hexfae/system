{
  lib,
  config,
  ...
}: {
  options.huncs.programs.git.enable = lib.mkOption {
    type = lib.types.bool;
    default = true;
  };

  config = lib.mkIf config.huncs.programs.git.enable {
    home-manager.users.hexfae.programs.git = {
      enable = true;
      settings = {
        user = {
          name = "hexfae";
          email = "hexfae@proton.me";
          init.defaultBranch = "main";
        };
      };
    };
  };
}
