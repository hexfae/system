{...}: {
  imports =
    [(import ./git.nix)]
    ++ [(import ./helix.nix)]
    ++ [(import ./zellij.nix)]
    ++ [(import ./zoxide.nix)]
    ++ [(import ./firefox.nix)]
    ++ [(import ./nushell.nix)]
    ++ [(import ./wezterm.nix)]
    ++ [(import ./starship.nix)];
}
