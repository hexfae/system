{inputs, ...}: {
  flake.modules = {
    nixos.agenix = {
      pkgs,
      config,
      ...
    }: {
      imports = [inputs.agenix.nixosModules.default];
      age.identityPaths = ["/etc/ssh/ssh_host_ed25519_key"];
      environment.systemPackages = [inputs.agenix.packages.${pkgs.stdenv.hostPlatform.system}.default];
      home-manager.sharedModules = [
        inputs.agenix.homeManagerModules.default
        {age.identityPaths = ["/home/${config.constants.username}/.ssh/id_ed25519"];}
      ];
    };
  };
}
