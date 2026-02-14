{
  flake.modules.homeManager.qimgv = {pkgs, ...}: {
    home.packages = [pkgs.qimgv];
  };
}
