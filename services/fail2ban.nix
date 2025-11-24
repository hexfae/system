{
  lib,
  config,
  ...
}: {
  options.huncs.services.fail2ban.enable = lib.mkOption {
    type = lib.types.bool;
    default = true;
  };

  config = lib.mkIf config.huncs.services.fail2ban.enable {
    services.fail2ban = {
      enable = true;
      bantime = "24h";
      bantime-increment.enable = true;
    };
  };
}
