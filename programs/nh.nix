{...}: {
  programs.nh = {
    enable = true;
    # flake = /home/hexfae/nix;
    clean = {
      enable = true;
      extraArgs = "--keep 10 --keep-since 7d";
    };
  };
}
