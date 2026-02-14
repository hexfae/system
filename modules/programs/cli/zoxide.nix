{
  flake.modules.homeManager.zoxide = {
    lib,
    config,
    ...
  }: {
    programs.zoxide = {
      enable = true;
      enableNushellIntegration = lib.mkIf config.programs.nushell.enable true;
    };
  };
}
