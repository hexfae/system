{inputs, ...}: {
  flake.modules = {
    nixos.bottles = {
      home-manager.sharedModules = [inputs.self.modules.homeManager.bottles];
    };
    homeManager.bottles = {pkgs, ...}: {
      home.packages = [(pkgs.bottles.override {removeWarningPopup = true;})];
    };
  };
}
