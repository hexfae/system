{inputs, ...}: {
  flake.modules = {
    nixos.obsidian.home-manager.sharedModules = [inputs.self.modules.homeManager.obsidian];
    homeManager.obsidian.programs.obsidian = {
      enable = true;
      vaults."md".target = "dox/md";
    };
  };
}
