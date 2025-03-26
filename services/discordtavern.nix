{config, ...}: {
  services.discordtavern.enable = true;
  age.secrets.discordtavern.file = ../secrets/discordtavern.age;
  age.secrets.discordtavern.owner = "discordtavern";
  services.discordtavern.configFile = config.age.secrets.discordtavern.path;
}
