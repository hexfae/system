{
  lib,
  config,
  vars,
  ...
}: {
  # act as a wireguard server, running on the machine with the hostname "server"
  options.huncs.networking.wireguard.server.enable = lib.mkEnableOption "wireguard server";

  config = lib.mkIf config.huncs.networking.wireguard.server.enable {
    age.secrets.server-wireguard-private-key.file = ../secrets/server-wireguard-private-key.age;

    networking = {
      firewall = {
        allowedUDPPorts = [vars.networking.server.port];
        trustedInterfaces = ["wg0"];
      };
      wg-quick.interfaces = {
        wg0 = {
          address = [vars.networking.server.wgIp];
          listenPort = vars.networking.server.port;
          privateKeyFile = config.age.secrets.server-wireguard-private-key.path;
          peers = [
            {
              publicKey = vars.networking.desktop.publicKey;
              allowedIPs = vars.networking.desktop.allowedIPs;
            }
            {
              publicKey = vars.networking.phone.publicKey;
              allowedIPs = vars.networking.phone.allowedIPs;
            }
          ];
        };
      };
    };
  };
}
