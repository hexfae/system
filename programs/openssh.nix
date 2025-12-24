{
  lib,
  config,
  vars,
  ...
}: {
  options.huncs.programs.openssh.enable = lib.mkOption {
    type = lib.types.bool;
    default = true;
  };

  config = lib.mkIf config.huncs.programs.openssh.enable {
    home-manager.users.${vars.username}.programs.ssh = {
      enable = true;
      enableDefaultConfig = false;
      matchBlocks = {
        "*" = {
          forwardAgent = false;
          addKeysToAgent = "no";
          compression = false;
          serverAliveInterval = 0;
          serverAliveCountMax = 3;
          hashKnownHosts = false;
          userKnownHostsFile = "~/.ssh/known_hosts";
          controlMaster = "no";
          controlPath = "~/.ssh/master-%r@%n:%p";
          controlPersist = "no";
        };
        "server" = {
          host = "server";
          hostname = vars.networking.server.ip;
          controlMaster = "auto";
          controlPath = "~/.ssh/master-%r@%n:%p";
          controlPersist = "10m";
          compression = true;
        };
      };
    };
  };
}
