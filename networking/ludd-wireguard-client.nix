{
  lib,
  config,
  ...
}: {
  # act as a wireguard client, connecting to ludd's network
  options.huncs.networking.wireguard.client.ludd.enable = lib.mkEnableOption "ludd wireguard client";

  config = lib.mkIf config.huncs.networking.wireguard.client.ludd.enable {
    age.secrets.ludd-wireguard-private-key.file = ../secrets/ludd-wireguard-private-key.age;
    networking.wg-quick.interfaces.LUDD = {
      address = ["192.168.69.17/32"];
      privateKeyFile = config.age.secrets.ludd-wireguard-private-key.path;

      peers = [
        {
          publicKey = "CkHERo9J8Kz4UxtZRXx3JhQpb8jfxeqBxdbkMGp3piE=";
          allowedIPs = [
            "10.30.0.0/16"
            "10.10.0.0/16"
            "192.168.42.0/24"
            "10.30.104.0/21"
          ];
          endpoint = "130.240.22.206:51820";
          persistentKeepalive = 25;
        }
      ];
    };
  };
}
