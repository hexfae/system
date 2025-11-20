{
  pkgs,
  inputs,
  ...
}: {
  users = {
    mutableUsers = false;
    users.hexfae = {
      isNormalUser = true;
      password = "pass";
      extraGroups = ["networkmanager" "wheel" "input" "libvirtd" "transmission" "dialout"];
    };
  };
  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    backupFileExtension = "backup";
    users.hexfae = {
      programs.home-manager.enable = true;
      home = {
        username = "hexfae";
        homeDirectory = "/home/hexfae";
        packages = with pkgs; [
          uutils-coreutils-noprefix
          inputs.agenix.packages.${pkgs.stdenv.hostPlatform.system}.default
        ];
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
