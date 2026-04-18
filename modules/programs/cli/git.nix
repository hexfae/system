{
  flake.modules.homeManager.git = {
    lib,
    config,
    vars,
    ...
  }: {
    programs.git = {
      enable = true;
      signing = {
        format = "ssh";
        key = "${config.constants.home}/.ssh/id_ed25519.pub";
        signByDefault = true;
      };
      settings = {
        push.autoSetupRemote = true;
        init.defaultBranch = "main";
        user = {
          name = config.constants.username;
          email = config.constants.email;
        };
      };
    };
  };
}
