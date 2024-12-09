{pkgs, ...}: {
  users.users.hexfae.isNormalUser = true;
  users.users.hexfae.password = "pass";
  users.users.hexfae.extraGroups = ["wheel" "input"];
  users.users.hexfae.shell = pkgs.nushell;
  home-manager.users.hexfae.home.username = "hexfae";
  home-manager.users.hexfae.home.homeDirectory = "/home/hexfae";
  home-manager.users.hexfae.xdg.userDirs.enable = true;
  home-manager.users.hexfae.xdg.userDirs.createDirectories = true;
  home-manager.users.hexfae.xdg.userDirs.desktop = null;
  home-manager.users.hexfae.xdg.userDirs.publicShare = null;
  home-manager.users.hexfae.xdg.userDirs.templates = null;
  home-manager.users.hexfae.xdg.userDirs.documents = "/home/hexfae/dox";
  home-manager.users.hexfae.xdg.userDirs.download = "/home/hexfae/dwn";
  home-manager.users.hexfae.xdg.userDirs.music = "/home/hexfae/mus";
  home-manager.users.hexfae.xdg.userDirs.pictures = "/home/hexfae/pix";
  home-manager.users.hexfae.xdg.userDirs.videos = "/home/hexfae/vid";
}
