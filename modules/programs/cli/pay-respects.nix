{
  flake.modules.homeManager.pay-respects = {
    lib,
    config,
    ...
  }: {
    programs.pay-respects = {
      enable = true;
      enableNushellIntegration = lib.mkIf config.programs.nushell.enable true;
    };
  };
}
