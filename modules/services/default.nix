{...}: {
  imports = [
    ./ssh.nix
    ./swww.nix
    ./mullvad.nix
    ./openrgb.nix
    ./transmission.nix
    ./auto-cpufreq.nix
    ./home-assistant.nix
    ./syncthing.nix
    ./virtualization.nix
    ./pipewire.nix
  ];
}
