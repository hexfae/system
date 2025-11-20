{
  config,
  lib,
  ...
}: {
  options.huncs.services.harry.enable = lib.mkEnableOption "harry";

  config = lib.mkIf config.huncs.services.harry.enable {
    services.harry.enable = true;
    age.secrets.harry.file = ../secrets/harry.age;
    age.secrets.harry.owner = "harry";
    services.harry.configFile = config.age.secrets.harry.path;
  };
}
