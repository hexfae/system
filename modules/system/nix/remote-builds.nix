{
  flake.modules.nixos.remote-builds = {
    nix = {
      distributedBuilds = true;
      settings.builders-use-substitutes = true;
      buildMachines = [
        {
          hostName = "129.151.192.240";
          system = "aarch64-linux";
          protocol = "ssh-ng";
          supportedFeatures = ["nixos-test" "benchmark" "big-parallel" "kvm"];
        }
      ];
    };
  };
}
