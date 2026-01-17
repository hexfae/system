let
  vars = import ../vars.nix;

  all = vars.keys.${vars.username} ++ vars.keys.root;
in {
  "transmission.age".publicKeys = all;
  "github-token.age".publicKeys = all;
  "vortex-password.age".publicKeys = all;
  "discordtavern.age".publicKeys = all;
  "harry.age".publicKeys = all;
  "syncthing-desktop-cert.age".publicKeys = all;
  "syncthing-desktop-key.age".publicKeys = all;
  "syncthing-thinkpad-cert.age".publicKeys = all;
  "syncthing-thinkpad-key.age".publicKeys = all;
  "syncthing-server-cert.age".publicKeys = all;
  "syncthing-server-key.age".publicKeys = all;
  "ludd-wireguard-private-key.age".publicKeys = all;
  "ludd-s3-secret-access-key.age".publicKeys = all;
  "server-wireguard-private-key.age".publicKeys = all;
  "desktop-wireguard-private-key.age".publicKeys = all;
}
