{
  flake.modules.homeManager.imagemagick = {pkgs, ...}: {
    home.packages = [pkgs.imagemagick];
  };
}
