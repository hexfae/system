{
  lib,
  config,
  ...
}: {
  # act as a wireguard client, connecting to the machine with the hostname "server"
  options.huncs.networking.wireguard.client.server.enable = lib.mkEnableOption "server wireguard client";

  config = lib.mkIf config.huncs.networking.wireguard.client.server.enable {
    age.secrets.desktop-wireguard-private-key.file = ../secrets/desktop-wireguard-private-key.age;
    networking.wg-quick.interfaces.Server = {
      address = ["10.100.0.2/24"];
      privateKeyFile = config.age.secrets.desktop-wireguard-private-key.path;
      peers = [
        {
          # server
          publicKey = "QXjD222mBO0VVz1ZiChRfAgeZmU3B5Az99R8N/soYk4=";
          allowedIPs = ["10.100.0.0/24"];
          endpoint = "129.151.192.240:51820";
          persistentKeepalive = 25;
        }
      ];
    };
  };
}
