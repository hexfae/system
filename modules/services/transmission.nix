{
  pkgs,
  lib,
  config,
  ...
}: {
  config = lib.mkIf config.huncs.services.transmission.enable {
    age.secrets.transmission.file = ../secrets/transmission.age;
    services.transmission = {
      enable = true;
      webHome = pkgs.flood-for-transmission;
      performanceNetParameters = true;
      package = pkgs.transmission_4;
      openRPCPort = true;
      openPeerPorts = true;
      credentialsFile = config.age.secrets.transmission.path;
      settings = {
        rpc-bind-address = "0.0.0.0";
        rpc-whitelist-enabled = false;
        rpc-authentication-required = true;
      };
    };
  };
}
