{
  flake-file.inputs = {
    agenix = {
      url = "github:ryantm/agenix";
      # url = "github:yaxitech/ragenix";
      inputs = {
        nixpkgs.follows = "nixpkgs";
        systems.follows = "systems";
        home-manager = {
          follows = "home-manager";
          inputs.nixpkgs.follows = "nixpkgs";
        };
      };
    };
    secrets = {
      url = "path:./secrets";
      flake = false;
    };
  };
}
