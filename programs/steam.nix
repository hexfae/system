{pkgs, ...}: {
  programs.steam.enable = true;
  programs.steam.extraCompatPackages = [pkgs.proton-ge-bin];
  programs.steam.extest.enable = true;
}
