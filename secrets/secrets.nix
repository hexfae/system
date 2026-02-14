let
  keys = import ./keys.nix;
  all = keys.hexfae ++ keys.root;
in {
  "authentication/ludd-s3-secret-access-key.age".publicKeys = all;
  "authentication/github-token.age".publicKeys = all;
  "authentication/vortex-password.age".publicKeys = all;

  "configs/harry.age".publicKeys = all;

  "syncthing/desktop-cert.age".publicKeys = all;
  "syncthing/desktop-key.age".publicKeys = all;
  "syncthing/thinkpad-cert.age".publicKeys = all;
  "syncthing/thinkpad-key.age".publicKeys = all;
  "syncthing/server-cert.age".publicKeys = all;
  "syncthing/server-key.age".publicKeys = all;

  "wireguard/ludd-private-key.age".publicKeys = all;
  "wireguard/server-private-key.age".publicKeys = all;
  "wireguard/desktop-private-key.age".publicKeys = all;
}
