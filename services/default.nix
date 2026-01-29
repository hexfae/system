{...}: {
  imports = [
    ./pipewire.nix
    ./swww.nix
    ./mysql.nix
    ./docker.nix
    ./easyeffects.nix
    ./openssh.nix
    ./harry.nix
    ./auto-cpufreq.nix
    ./nginx.nix
    ./fail2ban.nix
    ./kerberos.nix
    ./syncthing.nix
  ];
}
