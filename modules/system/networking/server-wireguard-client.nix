{inputs, ...}: {
  flake.modules.nixos.server-wireguard-client = {config, ...}: {
    # act as a wireguard client, connecting to the machine with the hostname "server"
    age.secrets.desktop-wireguard-private-key.file = inputs.self + /secrets/wireguard/desktop-private-key.age;
    networking.wg-quick.interfaces.Server = {
      address = [config.constants.networking.desktop.wgIp];
      privateKeyFile = config.age.secrets.desktop-wireguard-private-key.path;

      peers = [
        {
          publicKey = config.constants.networking.server.publicKey;
          allowedIPs = config.constants.networking.server.allowedIPs;
          endpoint = config.constants.networking.server.endpoint;
        }
      ];
    };
  };
}
