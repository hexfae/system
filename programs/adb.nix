{...}: {
  programs.adb.enable = true;
  users.users.hexfae.extraGroups = ["adbusers"];
}
