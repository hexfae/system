{
  lib,
  config,
  vars,
  ...
}: let
  user = vars.username;
in {
  options.huncs.programs.git.enable = lib.mkOption {
    type = lib.types.bool;
    default = true;
  };

  config = lib.mkIf config.huncs.programs.git.enable {
    age.secrets = {
      github-token = {
        file = ../secrets/github-token.age;
        owner = "${user}";
      };
      vortex-password = {
        file = ../secrets/vortex-password.age;
        owner = "${user}";
      };
    };

    home-manager.users.${user}.programs.git = {
      enable = true;
      settings = {
        user = {
          name = "${user}";
          email = "${vars.email}";
        };
        init.defaultBranch = "main";
        "credential \"https://github.com\"" = {
          username = "${user}";
          helper = "store --file ${config.age.secrets.github-token.path}";
        };
        "credential \"https://git.ludd.ltu.se\"" = {
          username = "${user}";
          helper = "store --file ${config.age.secrets.vortex-password.path}";
        };
      };
    };
  };
}
