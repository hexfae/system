let
  desktop = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIKmYt2uCGGDrW9ckK1ubHf0x+ttmGwi2OHeUc5FonB+X root@desktop";
  server = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIO3rgqbhUiuc5MV+niwye5UluNH/ERtBoUbrtZIixrPp root@server";
  laptop = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIDVGbEm5nO4L5VQxlfRHKM8kroTUUb06wPa7ot4fqz09 root@laptop";
  thinkpad = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIGW6UmPfAV2qVVHDqGit+OSPQd0dzmj9P0MqvYShkdVK root@thinkpad";

  all = [desktop server laptop thinkpad];
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
