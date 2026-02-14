{
  flake-file.inputs = {
    stylix = {
      url = "github:nix-community/stylix";
      inputs = {
        nixpkgs.follows = "nixpkgs";
        systems.follows = "systems";
        flake-parts = {
          follows = "flake-parts";
          inputs.nixpkgs-lib.follows = "nixpkgs";
        };
        nur = {
          follows = "nur";
          inputs = {
            nixpkgs.follows = "nixpkgs";
            flake-parts.follows = "nixpkgs";
          };
        };
      };
    };
  };
}
