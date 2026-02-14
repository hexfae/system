{inputs, ...}: {
  flake-file.inputs.preservation.url = "github:nix-community/preservation";
  flake.modules.nixos.preservation.imports = [inputs.preservation.nixosModules.preservation];
}
