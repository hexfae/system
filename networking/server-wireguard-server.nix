{
  lib,
  config,
  ...
}: {
  # act as a wireguard server, running on the machine with the hostname "server"
  options.huncs.networking.wireguard.server.enable = lib.mkEnableOption "wireguard server";

  config = lib.mkIf config.huncs.networking.wireguard.server.enable {
    age.secrets.server-wireguard-private-key.file = ../secrets/server-wireguard-private-key.age;

    networking = {
      firewall = {
        allowedUDPPorts = [51820];
        trustedInterfaces = ["wg0"];
      };
      wg-quick.interfaces = {
        wg0 = {
          address = ["10.100.0.1/24"];
          listenPort = 51820;
          privateKeyFile = config.age.secrets.server-wireguard-private-key.path;
          peers = [
            {
              # desktop
              publicKey = "ArMsMaebYbsZ1tEaW4xnyjniCOGsWPvWbaeCwCIwiHk=";
              allowedIPs = ["10.100.0.2/32"];
            }
            {
              # phone
              publicKey = "MB8cQUyUsUIlR5i2WjgtWib0PhIRNSV5vCbWxDM0fyw=";
              allowedIPs = ["10.100.0.3/32"];
            }
          ];
        };
      };
    };
  };
}
