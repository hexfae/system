{inputs, ...}: {
  flake-file.inputs.nix-index-database = {
    url = "github:nix-community/nix-index-database";
    inputs.nixpkgs.follows = "nixpkgs";
  };
  flake.modules.nixos.nix-index-database = {
    imports = [inputs.nix-index-database.nixosModules.nix-index];
    programs.nix-index-database.comma.enable = true;
  };
}
