{
  lib,
  config,
  vars,
  ...
}: {
  # act as a wireguard client, connecting to the machine with the hostname "server"
  options.huncs.networking.wireguard.client.server.enable = lib.mkEnableOption "server wireguard client";

  config = lib.mkIf config.huncs.networking.wireguard.client.server.enable {
    age.secrets.desktop-wireguard-private-key.file = ../secrets/desktop-wireguard-private-key.age;
    networking.wg-quick.interfaces.Server = {
      address = [vars.networking.desktop.wgIp];
      privateKeyFile = config.age.secrets.desktop-wireguard-private-key.path;

      peers = [
        {
          publicKey = vars.networking.server.publicKey;
          allowedIPs = vars.networking.server.allowedIPs;
          endpoint = vars.networking.server.endpoint;
        }
      ];
    };
  };
}
