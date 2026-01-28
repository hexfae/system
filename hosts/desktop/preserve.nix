{vars, ...}: {
  systemd.suppressedSystemUnits = ["systemd-machine-id-commit.service"];
  preservation = {
    enable = true;
    preserveAt."/preserve" = {
      directories = [
        "/var/log"
        "/var/lib/systemd/coredump"
        "/var/lib/systemd/timers"
        {
          directory = "/var/lib/nixos";
          inInitrd = true;
        }
      ];
      files = [
        {
          file = "/etc/machine-id";
          inInitrd = true;
        }
        {
          file = "/etc/ssh/ssh_host_ed25519_key";
          how = "symlink";
          configureParent = true;
        }
        {
          file = "/etc/ssh/ssh_host_ed25519_key.pub";
          how = "symlink";
          configureParent = true;
        }
      ];
      users.${vars.username} = {
        commonMountOptions = ["x-gvfs-hide"];
        files = [".config/nushell/history.txt"];
        directories = [
          "dox"
          "mus"
          "pix"
          "vid"
          "nix"
          "gam"
          ".zen"
          {
            directory = ".ssh";
            mode = "0700";
          }
          ".config/discordcanary"
          ".steam"
          ".local/share/Steam"
          ".local/share/TelegramDesktop/tdata"
          ".local/share/bottles"
        ];
      };
    };
  };
}
