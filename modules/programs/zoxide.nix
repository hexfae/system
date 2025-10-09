{
  lib,
  config,
  ...
}: {
  config = lib.mkIf config.huncs.programs.zoxide.enable {
    home-manager.users.hexfae.programs.zoxide = {
      enable = true;
      enableNushellIntegration = true;
    };
  };
}
