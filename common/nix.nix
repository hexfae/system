{...}: {
  nixpkgs.config.allowUnfree = true;
  documentation.nixos.enable = false;
  documentation.man.enable = false;
  documentation.enable = false;
  nix.settings = {
    experimental-features = "nix-command flakes";
    use-xdg-base-directories = true;
  };
}
