{inputs, ...}: {
  flake.modules.nixos.gaming = {
    imports = [inputs.self.modules.nixos.steam];
    home-manager.sharedModules = with inputs.self.modules.homeManager; [
      bottles
      prismlauncher
    ];
  };
}
