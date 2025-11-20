{config, ...}: {
  networking.networkmanager.enable = true;
  age.secrets.ludd-wireguard-private-key.file = ../secrets/ludd-wireguard-private-key.age;
  networking.wireguard.interfaces."LUDD" = {
    ips = ["192.168.69.17/32"];
    privateKeyFile = config.age.secrets.ludd-wireguard-private-key.path;
    peers = [
      {
        endpoint = "130.240.22.206:51820";
        publicKey = "CkHERo9J8Kz4UxtZRXx3JhQpb8jfxeqBxdbkMGp3piE=";
        allowedIPs = [
          "10.30.0.0/16"
          "10.10.0.0/16"
          "192.168.42.0/24"
          "10.30.104.0/21"
        ];
      }
    ];
  };
  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";
  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;
}
