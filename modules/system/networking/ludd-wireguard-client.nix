{inputs, ...}: {
  flake.modules.nixos.ludd-wireguard-client = {config, ...}: {
    # act as a wireguard client, connecting to ludd's network
    age.secrets.ludd-wireguard-private-key.file = inputs.self + /secrets/wireguard/ludd-private-key.age;
    networking.wg-quick.interfaces.LUDD = {
      address = [config.constants.networking.ludd.wgIp];
      privateKeyFile = config.age.secrets.ludd-wireguard-private-key.path;

      peers = [
        {
          publicKey = config.constants.networking.ludd.publicKey;
          allowedIPs = config.constants.networking.ludd.allowedIPs;
          endpoint = config.constants.networking.ludd.endpoint;
        }
      ];
    };
  };
}
