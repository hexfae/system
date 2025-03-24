{
  pkgs,
  config,
  ...
}: {
  services.transmission.enable = true;
  services.transmission.webHome = pkgs.flood-for-transmission;
  services.transmission.performanceNetParameters = true;
  services.transmission.package = pkgs.transmission_4;
  services.transmission.openRPCPort = true;
  services.transmission.openPeerPorts = true;
  services.transmission.settings.rpc-bind-address = "0.0.0.0";
  services.transmission.settings.rpc-whitelist-enabled = false;
  services.transmission.settings.rpc-authentication-required = true;
  age.secrets.transmission.file = ../secrets/transmission.age;
  services.transmission.credentialsFile = config.age.secrets.transmission.path;
}
