{...}: {
  home-manager.users.hexfae.programs.waybar = {
    enable = true;
    systemd.enable = true;
    settings = {
      mainBar = {
        layer = "top";
        position = "top";
        output = ["DP-2"];

        modules-left = ["niri/workspaces" "wlr/taskbar"];
        modules-center = ["clock"];
        modules-right = ["bluetooth" "wireplumber"];
      };
    };
  };
}
