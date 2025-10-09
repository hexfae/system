{
  lib,
  config,
  ...
}: {
  config = lib.mkIf config.huncs.services.syncthing.enable {
    home-manager.users.hexfae.services.syncthing = {
      enable = true;
      tray.enable = true;
      settings = {
        options.urAccepted = -1;
        folders."/home/hexfae/dox".devices = ["server"];
        devices = {
          server = {
            addresses = [""];
            id = "";
          };
        };
      };
    };
  };
}
