{inputs, ...}: {
  imports = [inputs.flake-file.flakeModules.dendritic];
  flake-file.inputs.systems.url = "github:nix-systems/default";
}
