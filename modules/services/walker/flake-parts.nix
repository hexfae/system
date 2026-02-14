{
  flake-file.inputs = {
    elephant = {
      url = "github:abenz1267/elephant";
      inputs = {
        nixpkgs.follows = "nixpkgs";
        systems.follows = "systems";
      };
    };
    walker = {
      url = "github:abenz1267/walker";
      inputs = {
        nixpkgs.follows = "nixpkgs";
        systems.follows = "systems";
        elephant = {
          follows = "elephant";
          inputs = {
            nixpkgs.follows = "nixpkgs";
            systems.follows = "systems";
          };
        };
      };
    };
  };
}
