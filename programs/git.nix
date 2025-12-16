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
    age.secrets = {
      github-token = {
        file = ../secrets/github-token.age;
        owner = "hexfae";
      };
      vortex-password = {
        file = ../secrets/vortex-password.age;
        owner = "hexfae";
      };
    };

    home-manager.users.hexfae.programs.git = {
      enable = true;
      settings = {
        user = {
          name = "hexfae";
          email = "hexfae@proton.me";
        };
        init.defaultBranch = "main";
        "credential \"https://github.com\"" = {
          username = "hexfae";
          helper = "store --file ${config.age.secrets.github-token.path}";
        };
        "credential \"https://git.ludd.ltu.se\"" = {
          username = "hexfae";
          helper = "store --file ${config.age.secrets.vortex-password.path}";
        };
      };
    };
  };
}
