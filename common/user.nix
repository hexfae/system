{
  pkgs,
  inputs,
  config,
  vars,
  ...
}: let
  user = vars.username;
  stateHome = config.home-manager.users.${user}.xdg.stateHome;
  dataHome = config.home-manager.users.${user}.xdg.dataHome;
  configHome = config.home-manager.users.${user}.xdg.configHome;
in {
  services.userborn.enable = true;
  users = {
    mutableUsers = false;
    users.${user} = {
      isNormalUser = true;
      hashedPasswordFile = "../secrets/user-password.txt";
      extraGroups = ["networkmanager" "wheel" "input" "libvirtd" "transmission" "dialout"];
      uid = vars.uid;
    };
  };
  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    backupFileExtension = "backup";
    users.${user} = {
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
        username = "${user}";
        homeDirectory = "/home/${user}";
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
          documents = "/home/${user}/dox";
          download = "/home/${user}/dwn";
          music = "/home/${user}/mus";
          pictures = "/home/${user}/pix";
          videos = "/home/${user}/vid";
        };
      };
    };
  };
}
