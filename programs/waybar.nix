{...}: {
  home-manager.users.hexfae.programs.waybar = {
    enable = true;
    systemd.enable = true;
    style = ''
      * {
        font-family: "Atkinson Hyperlegible Next", "Maple Mono NF CN";
        font-size: 1rem;
      }

      window#waybar {
        background: @theme_base_color;
        border-bottom: 1px solid @unfocused_borders;
        color: @theme_text_color;
      }

      /*#clock {
        background-color: #1d1d1d;
        border-radius: 100%;
      }*/
    '';
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
