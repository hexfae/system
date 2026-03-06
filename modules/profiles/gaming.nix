{inputs, ...}: {
  flake.modules.nixos.gaming.imports = with inputs.self.modules.nixos; [
    bottles
    steam
    prismlauncher
  ];
}
