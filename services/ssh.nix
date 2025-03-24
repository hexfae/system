{...}: {
  services.openssh.enable = true;
  services.openssh.settings.PrintLastLog = "no";
  services.openssh.settings.PermitRootLogin = "no";
  services.openssh.settings.PasswordAuthentication = false;
  users.users.hexfae.openssh.authorizedKeys.keys = [
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIFgwHT+7izURfC1KD7wmNSkailyQ91LLzhujA0GGS6QZ hexfae@desktop"
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIKO7j5bOF6OQgCEP2ZIeJ6VYdUInEmYCKc4fxNTluSi0 hexfae@server"
  ];
}
