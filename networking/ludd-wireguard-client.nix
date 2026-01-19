{
  lib,
  config,
  vars,
  ...
}: {
  # act as a wireguard client, connecting to ludd's network
  options.huncs.networking.wireguard.client.ludd.enable = lib.mkEnableOption "ludd wireguard client";

  config = lib.mkIf config.huncs.networking.wireguard.client.ludd.enable {
    age.secrets.ludd-wireguard-private-key.file = ../secrets/wireguard/ludd-private-key.age;
    networking.wg-quick.interfaces.LUDD = {
      address = [vars.networking.ludd.wgIp];
      privateKeyFile = config.age.secrets.ludd-wireguard-private-key.path;

      peers = [
        {
          publicKey = vars.networking.ludd.publicKey;
          allowedIPs = vars.networking.ludd.allowedIPs;
          endpoint = vars.networking.ludd.endpoint;
        }
      ];
    };
  };
}
