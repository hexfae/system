let
  desktop_host = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIKmYt2uCGGDrW9ckK1ubHf0x+ttmGwi2OHeUc5FonB+X root@desktop";
  server_host = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIO3rgqbhUiuc5MV+niwye5UluNH/ERtBoUbrtZIixrPp root@server";
  laptop_host = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIDVGbEm5nO4L5VQxlfRHKM8kroTUUb06wPa7ot4fqz09 root@laptop";
  thinkpad_host = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIC8ZOr3RlFOoyiVWHGuSP/dnlMuT7A1Zu6ikVYNE5naE root@thinkpad";

  all = [desktop_host server_host laptop_host thinkpad_host];
in {
  "transmission.age".publicKeys = all;
  "github.age".publicKeys = all;
  "discordtavern.age".publicKeys = all;
  "harry.age".publicKeys = all;
  "syncthing.age".publicKeys = all;
  "ludd-s3-secret-access-key.age".publicKeys = all;
}
