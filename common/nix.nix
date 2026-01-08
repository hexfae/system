{
  pkgs,
  vars,
  ...
}: {
  nixpkgs.config.allowUnfree = true;
  documentation.nixos.enable = false;
  documentation.man.enable = false;
  documentation.enable = false;

  nixpkgs.overlays = [
    (final: prev: {
      inherit
        (prev.lixPackageSets.stable)
        nixpkgs-review
        nix-eval-jobs
        nix-fast-build
        colmena
        ;
    })
  ];
  nix = {
    package = pkgs.lixPackageSets.stable.lix;
    distributedBuilds = true;
    buildMachines = [
      {
        hostName = vars.networking.server.ip;
        system = "aarch64-linux";
        protocol = "ssh-ng";
        supportedFeatures = ["nixos-test" "benchmark" "big-parallel" "kvm"];
      }
    ];
    settings = {
      experimental-features = "nix-command flakes";
      use-xdg-base-directories = true;
      builders-use-substitutes = true;
      trusted-users = [vars.username];
      substituters = [
        "https://nix-community.cachix.org"
        "https://nyx.chaotic.cx"
      ];
      trusted-public-keys = [
        "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
        "nyx.chaotic.cx-1:HfnXSw4pj95iI/n17rIDy40agHj12WfF+Gqk6SonIT8="
      ];
    };
    optimise = {
      automatic = true;
      dates = "daily";
    };
  };
}
