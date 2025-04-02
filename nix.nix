{...}: {
  documentation.nixos.enable = false;
  nixpkgs.config.allowUnfree = true;
  home-manager.users.hexfae.home.sessionVariables.NIXPKGS_ALLOW_UNFREE = "1";
  nix.settings.auto-optimise-store = true;
  nix.settings.experimental-features = ["nix-command" "flakes"];
  nix.settings.trusted-users = ["hexfae"];
  nix.settings.builders-use-substitutes = true;
  nix.settings.substituters = [
    "https://cache.nixos.org"
    "https://helix.cachix.org"
    "https://nix-community.cachix.org"
    "https://anyrun.cachix.org"
    "https://wezterm.cachix.org"
  ];
  nix.settings.trusted-public-keys = [
    "cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY="
    "helix.cachix.org-1:ejp9KQpR1FBI2onstMQ34yogDm4OgU2ru6lIwPvuCVs="
    "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
    "anyrun.cachix.org-1:pqBobmOjI7nKlsUMV25u9QHa9btJK65/C8vnO3p346s="
    "wezterm.cachix.org-1:kAbhjYUC9qvblTE+s7S+kl5XM1zVa4skO+E/1IDWdH0="
  ];
}
