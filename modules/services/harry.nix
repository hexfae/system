{
  lib,
  config,
  ...
}: {
  config = lib.mkIf config.huncs.services.harry.enable {
    age.secrets.harry.file = ../secrets/harry.age;
    age.secrets.harry.owner = "harry";
    services.harry.enable = true;
    services.harry.configFile = config.age.secrets.harry.path;
  };
}
