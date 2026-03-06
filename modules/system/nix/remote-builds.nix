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
          supportedFeatures = ["nixos-test" "benchmark" "big-parallel" "kvm"];
        }
      ];
    };
  };
}
