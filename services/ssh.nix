{...}: {
  services.openssh = {
    enable = true;
    settings = {
      PrintLastLog = "no";
      PermitRootLogin = "no";
      PasswordAuthentication = false;
    };
  };
  users.users.hexfae.openssh.authorizedKeys.keys = [
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIFgwHT+7izURfC1KD7wmNSkailyQ91LLzhujA0GGS6QZ hexfae@desktop"
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIKO7j5bOF6OQgCEP2ZIeJ6VYdUInEmYCKc4fxNTluSi0 hexfae@server"
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIH8Dn+p+S3syLaLuY1eabWQ6kyu5cNQHJ4iErRQGEUmA hexfae@laptop"
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIIUSt7OfirUqrJVp1Gv0opWaD7klidgmvRddDXw4qYzj root@desktop"
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIO3rgqbhUiuc5MV+niwye5UluNH/ERtBoUbrtZIixrPp root@server"
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIDVGbEm5nO4L5VQxlfRHKM8kroTUUb06wPa7ot4fqz09 root@laptop"
  ];
}
