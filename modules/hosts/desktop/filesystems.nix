{
  flake.modules.nixos.desktop = {config, ...}: let
    username = config.constants.username;
  in {
    systemd.tmpfiles.rules = [
      "z /home/${username}/mnt 0755 ${username} users -"
    ];

    fileSystems = {
      "/home/${username}/mnt/usb" = {
        device = "/dev/disk/by-uuid/D566-24E7";
        fsType = "exfat";
        options = ["uid=1000" "gid=1000" "fmask=0133" "dmask=0022" "nofail"];
      };
      "/home/${username}/mnt/ext" = {
        device = "zext/data";
        fsType = "zfs";
        options = ["zfsutil" "noauto"];
      };
    };
  };
}
