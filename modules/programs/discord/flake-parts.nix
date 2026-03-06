{
  flake-file.inputs.nixcord = {
    url = "github:FlameFlag/nixcord";
    inputs = {
      nixpkgs.follows = "nixpkgs";
      flake-parts.follows = "flake-parts";
    };
  };
}
