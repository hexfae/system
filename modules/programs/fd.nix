{
  lib,
  config,
  ...
}: {
  config = lib.mkIf config.huncs.programs.fd.enable {
    home-manager.users.hexfae.programs.fd.enable = true;
  };
}
