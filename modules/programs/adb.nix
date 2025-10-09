{
  lib,
  config,
  ...
}: {
  config = lib.mkIf config.huncs.programs.adb.enable {
    programs.adb.enable = true;
    users.users.hexfae.extraGroups = ["adbusers"];
  };
}
