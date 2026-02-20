{inputs, ...}: {
  flake.modules = {
    nixos.noctalia-shell = {
      home-manager.sharedModules = [
        inputs.noctalia-shell.homeModules.default
        inputs.self.modules.homeManager.noctalia-shell
      ];
    };
    homeManager.noctalia-shell = {
      programs.noctalia-shell = {
        enable = true;
        systemd.enable = true;
      };
    };
  };
}
