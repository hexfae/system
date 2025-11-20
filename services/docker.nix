{
  lib,
  config,
  ...
}: {
  options.huncs.services.docker.enable = lib.mkEnableOption "docker";

  config = lib.mkIf config.huncs.services.docker.enable {
    virtualisation.docker.enable = true;

    users.users.hexfae.extraGroups = ["docker"];
  };
}
