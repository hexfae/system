{
  flake.modules.nixos.remote-builds = {config, ...}: {
    nix = {
      distributedBuilds = true;
      settings.builders-use-substitutes = true;
      buildMachines = [
        {
          hostName = config.constants.networking.server.ip;
          system = "aarch64-linux";
          protocol = "ssh-ng";
          sshUser = config.constants.username;
          sshKey = "${config.constants.home}/.ssh/id_ed25519";
          supportedFeatures = ["nixos-test" "benchmark" "big-parallel" "kvm"];
        }
      ];
    };
  };
}
