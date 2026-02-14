{inputs, ...}: {
  flake.modules = {
    nixos.multimedia = {
      imports = [inputs.self.modules.nixos.obs-studio];
      home-manager.sharedModules = with inputs.self.modules.homeManager; [
        qimgv
        mpv
      ];
    };
  };
}
