{config, ...}: {
  services.harry.enable = true;
  age.secrets.harry.file = ../secrets/harry.age;
  age.secrets.harry.owner = "harry";
  services.harry.configFile = config.age.secrets.harry.path;
}
