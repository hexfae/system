{vars, ...}: {
  system.stateVersion = "24.11";
  home-manager.users.${vars.username}.home.stateVersion = "24.11";

  services.scx.enable = false;
  chaotic.mesa-git.enable = false;

  huncs = {
    networking.wireguard.server.enable = true;
    services = {
      harry.enable = true;
      nginx.enable = true;
    };
  };
}
