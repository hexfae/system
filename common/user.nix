{pkgs, ...}: {
  users = {
    mutableUsers = false;
    users.hexfae = {
      isNormalUser = true;
      password = "pass";
      extraGroups = ["networkmanager" "wheel" "input" "libvirtd" "transmission" "dialout"];
      shell = pkgs.nushell;
    };
  };
  home-manager = {
    # TODO: disable?
    useGlobalPkgs = true;
    useUserPackages = true;
    backupFileExtension = "backup";
    users.hexfae = {
      programs.home-manager.enable = true;
      home = {
        username = "hexfae";
        homeDirectory = "/home/hexfae";
      };
      xdg = {
        userDirs = {
          enable = true;
          createDirectories = true;
          desktop = null;
          publicShare = null;
          templates = null;
          documents = "/home/hexfae/dox";
          download = "/home/hexfae/dwn";
          music = "/home/hexfae/mus";
          pictures = "/home/hexfae/pix";
          videos = "/home/hexfae/vid";
        };
      };
    };
  };
}
