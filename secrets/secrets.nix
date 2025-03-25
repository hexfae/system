let
  desktop = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIFgwHT+7izURfC1KD7wmNSkailyQ91LLzhujA0GGS6QZ hexfae@desktop";
  server = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIKO7j5bOF6OQgCEP2ZIeJ6VYdUInEmYCKc4fxNTluSi0 hexfae@server";
  laptop = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIH8Dn+p+S3syLaLuY1eabWQ6kyu5cNQHJ4iErRQGEUmA hexfae@laptop";
  users = [desktop server laptop];

  desktop_host = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIIUSt7OfirUqrJVp1Gv0opWaD7klidgmvRddDXw4qYzj root@desktop";
  server_host = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIO3rgqbhUiuc5MV+niwye5UluNH/ERtBoUbrtZIixrPp root@server";
  laptop_host = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIDVGbEm5nO4L5VQxlfRHKM8kroTUUb06wPa7ot4fqz09 root@laptop";
  systems = [desktop_host server_host laptop_host];

  all = users ++ systems;
in {
  "transmission.age".publicKeys = all;
  "github.age".publicKeys = all;
}
