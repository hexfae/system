{
  flake.modules.homeManager.nh = {config, ...}: {
    programs.nh = {
      enable = true;
      flake = config.constants.nixDir;
      clean = {
        enable = true;
        extraArgs = "--keep 10 --keep-since 7d";
      };
    };
  };
}
