{inputs, ...}: {
  flake.modules.nixos.server-wireguard-server = {config, ...}: {
    # act as a wireguard server, running on the machine with the hostname "server"
    age.secrets.server-wireguard-private-key.file = inputs.self + /secrets/wireguard/server-private-key.age;

    networking = {
      firewall = {
        allowedUDPPorts = [config.constants.networking.server.port];
        trustedInterfaces = ["wg0"];
      };
      wg-quick.interfaces = {
        wg0 = {
          address = [config.constants.networking.server.wgIp];
          listenPort = config.constants.networking.server.port;
          privateKeyFile = config.age.secrets.server-wireguard-private-key.path;
          peers = [
            {
              publicKey = config.constants.networking.desktop.publicKey;
              allowedIPs = config.constants.networking.desktop.allowedIPs;
            }
            {
              publicKey = config.constants.networking.phone.publicKey;
              allowedIPs = config.constants.networking.phone.allowedIPs;
            }
          ];
        };
      };
    };
  };
}
