{inputs, ...}: {
  flake.modules = {
    nixos.syncthing = {
      lib,
      config,
      ...
    }: {
      systemd.services.syncthing.after = ["network-online.target"];
      systemd.services.syncthing.wants = ["network-online.target"];
      home-manager.sharedModules = [inputs.self.modules.homeManager.syncthing];
      age.secrets = {
        syncthing-cert = {
          file = config.constants.syncthing.cert-path;
          owner = config.constants.username;
        };
        syncthing-key = {
          file = config.constants.syncthing.key-path;
          owner = config.constants.username;
        };
      };
      services.syncthing = {
        enable = true;
        openDefaultPorts = true;
        user = config.constants.username;
        dataDir = config.constants.home;
        cert = config.age.secrets.syncthing-cert.path;
        key = config.age.secrets.syncthing-key.path;
        settings = {
          devices = config.constants.syncthing.peers;
          folders = {
            "mus" = {
              path = "~/mus";
              devices = config.constants.syncthing.devices;
            };
            "pix" = {
              path = "~/pix";
              devices = config.constants.syncthing.devices;
            };
            "vid" = {
              path = "~/vid";
              devices = config.constants.syncthing.devices;
            };
            "dox" = {
              path = "~/dox";
              devices = config.constants.syncthing.devices;
              ignorePatterns = [
                # rust build artifacts
                "target/"
                # these get made as nix store symlinks by the home manager obsidian module, phone is unfortunately not on nixos
                ".obsidian/community-plugins.json"
                ".obsidian/hotkeys.json"
              ];
            };
          };
        };
      };
    };
    homeManager.syncthing.xdg.desktopEntries."syncthing-ui" = {
      name = "Syncthing Web UI";
      exec = "syncthing";
      noDisplay = true;
    };
  };
}
