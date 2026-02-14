{
  flake.modules.homeManager.jujutsu = {config, ...}: {
    programs = {
      jjui.enable = true;
      jujutsu = {
        enable = true;
        settings.user = {
          name = config.constants.username;
          email = config.constants.email;
        };
      };
    };
  };
}
