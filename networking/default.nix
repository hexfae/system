{...}: {
  imports = [
    ./ludd-wireguard-client.nix
    ./server-wireguard-client.nix
    ./server-wireguard-server.nix
  ];

  networking.networkmanager.enable = true;
}
