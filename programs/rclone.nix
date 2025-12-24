{
  lib,
  config,
  vars,
  ...
}: let
  user = vars.username;
in {
  options.huncs.programs.rclone.enable = lib.mkOption {
    type = lib.types.bool;
    default = true;
  };

  config = lib.mkIf config.huncs.programs.rclone.enable {
    age.secrets.s3-ludd-secret-access-key.file = ../secrets/ludd-s3-secret-access-key.age;
    home-manager.users.${user}.programs.rclone = {
      enable = true;
      remotes = {
        server = {
          config = {
            type = "sftp";
            host = vars.networking.server.ip;
          };
          mounts."/home/${user}" = {
            enable = true;
            mountPoint = "/home/${user}/mnt/server";
          };
        };
        lvp = {
          secrets.secret_access_key = config.age.secrets.s3-ludd-secret-access-key.path;
          config = {
            type = "s3";
            provider = "Ceph";
            access_key_id = "DWODFUBR9ZWYBY4CZY6R";
            endpoint = "https://s3.ludd.ltu.se";
          };
          mounts."/lvp" = {
            enable = true;
            mountPoint = "/home/${user}/mnt/lvp";
          };
        };
      };
    };
  };
}
