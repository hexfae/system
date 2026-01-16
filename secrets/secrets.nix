let
  vars = import ../vars.nix;

  all = vars.keys.${vars.username} ++ vars.keys.root;
in {
  "transmission.age".publicKeys = all;
  "github-token.age".publicKeys = all;
  "vortex-password.age".publicKeys = all;
  "discordtavern.age".publicKeys = all;
  "harry.age".publicKeys = all;
  "syncthing.age".publicKeys = all;
  "ludd-wireguard-private-key.age".publicKeys = all;
  "ludd-s3-secret-access-key.age".publicKeys = all;
  "server-wireguard-private-key.age".publicKeys = all;
  "desktop-wireguard-private-key.age".publicKeys = all;
}
