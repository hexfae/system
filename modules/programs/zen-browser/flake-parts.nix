{
  flake-file.inputs = {
    zen-browser = {
      url = "github:0xc000022070/zen-browser-flake/feat/hm-module-sine-reusing-src-and-bootloader-everywhere";
      inputs = {
        nixpkgs.follows = "nixpkgs";
        home-manager = {
          follows = "home-manager";
          inputs.nixpkgs.follows = "nixpkgs";
        };
      };
    };
    nur = {
      url = "github:nix-community/NUR";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.flake-parts.follows = "flake-parts";
      inputs.flake-parts.inputs.nixpkgs-lib.follows = "nixpkgs";
    };
  };
}
