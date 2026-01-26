{
  vars,
  pkgs,
  ...
}: {
  system.stateVersion = "24.11";
  home-manager.users.${vars.username}.home.stateVersion = "24.11";

  boot.kernelPackages = pkgs.linuxPackages;

  huncs = {
    networking.wireguard.server.enable = true;
    services = {
      harry.enable = true;
      nginx.enable = true;
    };
  };
}
