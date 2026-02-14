{inputs, ...}: {
  flake.modules = {
    nixos.telegram-desktop.home-manager.sharedModules = [inputs.self.modules.homeManager.telegram-desktop];
    homeManager.telegram-desktop = {pkgs, ...}: {
      home.packages = [pkgs.telegram-desktop];
    };
  };
}
