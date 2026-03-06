{inputs, ...}: {
  flake.modules.homeManager.rclone = {
    lib,
    config,
    ...
  }: {
    age.secrets.s3-ludd-secret-access-key.file = inputs.self + /secrets/authentication/ludd-s3-secret-access-key.age;
    programs.rclone = {
      enable = true;
      remotes = {
        server = {
          config = {
            type = "sftp";
            host = config.constants.networking.server.ip;
          };
          mounts.server = {
            enable = true;
            mountPoint = "/home/${config.constants.username}/mnt/server";
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
          mounts.lvp = {
            enable = true;
            mountPoint = "/home/${config.constants.username}/mnt/lvp";
          };
        };
      };
    };
  };
}
