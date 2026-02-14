{
  flake.modules.homeManager.bottles = {pkgs, ...}: {
    home.packages = [(pkgs.bottles.override {removeWarningPopup = true;})];
  };
}
