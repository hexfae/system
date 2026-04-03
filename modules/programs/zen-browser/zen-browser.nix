{inputs, ...}: {
  flake.modules = {
    nixos.zen-browser = {
      nixpkgs.overlays = [inputs.nur.overlays.default];
      home-manager.sharedModules = [
        inputs.self.modules.homeManager.zen-browser
        inputs.zen-browser.homeModules.twilight
      ];
    };
    homeManager.zen-browser.programs.zen-browser.enable = true;
  };
}
