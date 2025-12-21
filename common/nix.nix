{...}: {
  nixpkgs.config.allowUnfree = true;
  documentation.nixos.enable = false;
  documentation.man.enable = false;
  documentation.enable = false;
  nix = {
    distributedBuilds = true;
    buildMachines = [
      {
        hostName = "129.151.192.240";
        system = "aarch64-linux";
        protocol = "ssh-ng";
        supportedFeatures = ["nixos-test" "benchmark" "big-parallel" "kvm"];
      }
    ];
    settings = {
      experimental-features = "nix-command flakes";
      use-xdg-base-directories = true;
      auto-optimise-store = true;
      builders-use-substitutes = true;
    };
  };
}
