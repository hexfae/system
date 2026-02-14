{inputs, ...}: {
  flake.modules = {
    nixos.walker = {
      home-manager.sharedModules = [inputs.self.modules.homeManager.walker];
      nix.settings = {
        extra-substituters = ["https://walker.cachix.org" "https://walker-git.cachix.org"];
        extra-trusted-public-keys = ["walker.cachix.org-1:fG8q+uAaMqhsMxWjwvk0IMb4mFPFLqHjuvfwQxE4oJM=" "walker-git.cachix.org-1:vmC0ocfPWh0S/vRAQGtChuiZBTAe4wiKDeyyXM0/7pM="];
      };
    };
    homeManager.walker = {
      imports = [inputs.walker.homeManagerModules.default];
      programs.walker = {
        enable = true;
        runAsService = true;
        config.theme = "default";
      };
    };
  };
}
