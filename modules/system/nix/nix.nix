{inputs, ...}: {
  flake.modules.nixos.nix = {config, ...}: {
    imports = [inputs.self.modules.nixos.lix];
    nixpkgs.config.allowUnfree = true;
    nix = {
      optimise = {
        automatic = true;
        dates = "daily";
      };
      settings = {
        experimental-features = "nix-command flakes";
        use-xdg-base-directories = true;
        trusted-users = [config.constants.username];
      };
    };
  };
}
