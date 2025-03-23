{...}: {
  programs.nh.enable = true;
  programs.nh.flake = /home/hexfae/nix;
  programs.nh.clean.enable = true;
  programs.nh.clean.extraArgs = "--keep 10 --keep-since 7d";
}
