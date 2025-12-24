{
  lib,
  config,
  vars,
  ...
}: {
  options.huncs.services.openssh.enable = lib.mkOption {
    type = lib.types.bool;
    default = true;
  };

  config = lib.mkIf config.huncs.services.openssh.enable {
    services.openssh = {
      enable = true;
      settings = {
        PrintLastLog = "no";
        PasswordAuthentication = false;
      };
    };
    users.users = {
      ${vars.username}.openssh.authorizedKeys.keys = vars.keys.${vars.username};
      root.openssh.authorizedKeys.keys = vars.keys.root;
    };
  };
}
