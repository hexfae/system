{inputs, ...}: {
  flake.modules.homeManager.git = {
    lib,
    config,
    vars,
    ...
  }: {
    age.secrets = {
      github-token.file = inputs.self + /secrets/authentication/github-token.age;
      vortex-password.file = inputs.self + /secrets/authentication/vortex-password.age;
    };

    programs.git = {
      enable = true;
      settings = {
        user = {
          name = config.constants.username;
          email = config.constants.email;
        };
        push.autoSetupRemote = true;
        init.defaultBranch = "main";
        "credential \"https://github.com\"" = {
          username = config.constants.username;
          helper = "store --file ${config.age.secrets.github-token.path}";
        };
        "credential \"https://git.ludd.ltu.se\"" = {
          username = config.constants.username;
          helper = "store --file ${config.age.secrets.vortex-password.path}";
        };
      };
    };
  };
}
