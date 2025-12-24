{
  pkgs,
  inputs,
  config,
  ...
}: let
  stateHome = config.home-manager.users.hexfae.xdg.stateHome;
  dataHome = config.home-manager.users.hexfae.xdg.dataHome;
  configHome = config.home-manager.users.hexfae.xdg.configHome;
in {
  age.secrets.user-password.file = ../secrets/user-password.age;
  services.userborn.enable = true;
  users = {
    mutableUsers = false;
    users.hexfae = {
      isNormalUser = true;
      hashedPasswordFile = config.age.secrets.user-password.path;
      extraGroups = ["networkmanager" "wheel" "input" "libvirtd" "transmission" "dialout"];
    };
  };
  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    backupFileExtension = "backup";
    users.hexfae = {
      programs = {
        home-manager.enable = true;
        bash.historyFile = "${stateHome}/bash/history";
      };
      gtk.gtk2.configLocation = "${configHome}/gtk-2.0/gtkrc";
      home = {
        sessionVariables = {
          CARGO_HOME = "${dataHome}/cargo";
          # TODO: zen browser directory (.zen)
          XCURSOR_PATH = "/usr/share/icons:${dataHome}/icons";
        };
        username = "hexfae";
        homeDirectory = "/home/hexfae";
        packages = with pkgs; [
          uutils-coreutils-noprefix
          inputs.agenix.packages.${pkgs.stdenv.hostPlatform.system}.default
        ];
      };
      xdg = {
        enable = true;
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
