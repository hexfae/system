{
  flake.modules.nixos.fail2ban.services.fail2ban = {
    enable = true;
    bantime = "24h";
    bantime-increment.enable = true;
  };
}
