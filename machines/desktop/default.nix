{...}: {
  imports = [(import ./configuration.nix)] ++ [(import ./hardware-configuration.nix)] ++ [(import ./disk-configuration.nix)];
}
