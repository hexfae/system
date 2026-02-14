{
  flake.modules.nixos.preservation = {config, ...}: {
    services.openssh.generateHostKeys = false;
    systemd.suppressedSystemUnits = ["systemd-machine-id-commit.service"];
    preservation = {
      enable = true;
      preserveAt."/preserve" = {
        directories = [
          "/var/log"
          "/var/lib/systemd/coredump"
          "/var/lib/systemd/timers"
          "/var/lib/nixos"
        ];
        files = [
          {
            file = "/etc/machine-id";
            inInitrd = true;
          }
          {
            file = "/etc/ssh/ssh_host_ed25519_key";
            how = "symlink";
            # configureParent = true;
            inInitrd = true;
          }
          {
            file = "/etc/ssh/ssh_host_ed25519_key.pub";
            how = "symlink";
            # configureParent = true;
            inInitrd = true;
          }
        ];
        users.${config.constants.username} = {
          commonMountOptions = ["x-gvfs-hide"];
          files = [".config/nushell/history.txt"];
          directories = [
            "dox"
            "mus"
            "mnt"
            "pix"
            "vid"
            "nix"
            "gam"
            {
              directory = ".ssh";
              mode = "0700";
            }
            ".steam"
            ".config/zen"
            ".config/equibop"
            ".config/obs-studio"
            ".local/share/Steam"
            ".local/share/bottles"
            ".local/share/PrismLauncher"
            ".local/share/TelegramDesktop/tdata"
          ];
        };
      };
    };
  };
}
