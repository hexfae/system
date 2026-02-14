{
  flake.modules.nixos.sshd = {config, ...}: let
    username = config.constants.username;
    user_keys = config.constants.keys.${username};
    root_keys = config.constants.keys.root;
    keys = user_keys ++ root_keys;
  in {
    services.openssh = {
      enable = true;
      settings = {
        PrintLastLog = "no";
        PasswordAuthentication = false;
        HostKeyAlgorithms = "ssh-ed25519";
      };
      hostKeys = [
        {
          path = "/etc/ssh/ssh_host_ed25519_key";
          type = "ed25519";
        }
      ];
    };
    users.users = {
      ${username}.openssh.authorizedKeys.keys = keys;
      root.openssh.authorizedKeys.keys = keys;
    };
  };
}
