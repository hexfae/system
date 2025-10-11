{...}: {
  documentation.nixos.enable = false;
  nixpkgs.config.allowUnfree = true;
  home-manager.users.hexfae.home.sessionVariables.NIXPKGS_ALLOW_UNFREE = "1";
  nix.settings = {
    auto-optimise-store = true;
    builders-use-substitutes = true;
    max-jobs = "auto";
    experimental-features = ["nix-command" "flakes"];
  };
}
