let
  vars = import ../vars.nix;
  all = vars.keys.${vars.username} ++ vars.keys.root;
in {
  "auth/ludd-s3-secret-access-key.age".publicKeys = all;
  "auth/github-token.age".publicKeys = all;
  "auth/vortex-password.age".publicKeys = all;

  "configs/harry.age".publicKeys = all;
  "configs/transmission.age".publicKeys = all;

  "wireguard/ludd-private-key.age".publicKeys = all;
  "wireguard/server-private-key.age".publicKeys = all;
  "wireguard/desktop-private-key.age".publicKeys = all;

  "syncthing/desktop-cert.age".publicKeys = all;
  "syncthing/desktop-key.age".publicKeys = all;
  "syncthing/thinkpad-cert.age".publicKeys = all;
  "syncthing/thinkpad-key.age".publicKeys = all;
  "syncthing/server-cert.age".publicKeys = all;
  "syncthing/server-key.age".publicKeys = all;
}
