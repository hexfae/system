{...}: {
  imports = [(import ./configuration.nix)] ++ [(import ./hardware-configuration.nix)];
}
