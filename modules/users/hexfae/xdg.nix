{
  flake.modules.nixos.user = {config, ...}: let
    user = config.constants.username;
  in {
    home-manager.sharedModules = [
      {
        home.preferXdgDirectories = true;
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
      }
    ];
  };
}
