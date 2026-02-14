{
  flake.modules.homeManager.uutils = {pkgs, ...}: {
    home.packages = [pkgs.uutils-coreutils-noprefix];
  };
}
