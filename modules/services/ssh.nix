{
  lib,
  config,
  ...
}: {
  config = lib.mkIf config.huncs.services.ssh.enable {
    services.openssh = {
      enable = true;
      settings = {
        PrintLastLog = "no";
        PermitRootLogin = "no";
        PasswordAuthentication = false;
      };
    };
    users.users.hexfae.openssh.authorizedKeys.keys = [
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIKwU23h31N5cH7YmezNyhy8wYXvdJxlMk+YQJ1p8WGH1 hexfae@desktop"
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIKO7j5bOF6OQgCEP2ZIeJ6VYdUInEmYCKc4fxNTluSi0 hexfae@server"
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIH8Dn+p+S3syLaLuY1eabWQ6kyu5cNQHJ4iErRQGEUmA hexfae@laptop"
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIECm6LZ8DR+ASM0Du6W50Zrw41LgaBD0Q6IXm4jtDSBC hexfae@thinkpad"
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIGubB/U8zwi90jwgRN9bDpmh0M58pBFN1IfqXgpHv4jv root@desktop"
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIO3rgqbhUiuc5MV+niwye5UluNH/ERtBoUbrtZIixrPp root@server"
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIDVGbEm5nO4L5VQxlfRHKM8kroTUUb06wPa7ot4fqz09 root@laptop"
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIC8ZOr3RlFOoyiVWHGuSP/dnlMuT7A1Zu6ikVYNE5naE root@thinkpad"
    ];
  };
}
