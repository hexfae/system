{
  lib,
  config,
  vars,
  ...
}: {
  options.huncs.programs.waybar.enable = lib.mkEnableOption "waybar";

  config = lib.mkIf config.huncs.programs.waybar.enable {
    home-manager.users.${vars.username}.programs.waybar = {
      enable = true;
      systemd.enable = true;
      style = ''
        * {
          font-family: "Atkinson Hyperlegible Next", "Maple Mono NF CN";
          font-size: 1rem;
          color: @theme_text_color;
        }

        window#waybar {
          background: @theme_base_color;
          border-bottom: 1px solid @unfocused_borders;
        }

        #workspaces button {
          border-radius: 0;
          padding: 0 0.4em;
        }

        #workspaces button.focused {
          background-color: #64727D;
        }

        #workspaces button:hover {
          background: rgba(0, 0, 0, 0.2);
        }

        #clock,
        #custom-clock,
        #battery,
        #cpu,
        #memory,
        #disk,
        #temperature,
        #backlight,
        #network,
        #pulseaudio,
        #custom-media,
        #tray,
        #mode,
        #wireplumber,
        #idle_inhibitor,
        #mpd {
            /*padding: 0 10px;*/
            margin: 6px 3px;
        }
      '';

      settings = {
        mainBar = {
          layer = "top";
          position = "top";
          output = ["DP-2" "eDP-1"];

          modules-left = ["niri/workspaces"];
          modules-center = ["clock"];
          modules-right = ["tray" "wireplumber"];

          tray = {
            icon-size = 16;
            spacing = 10;
          };

          clock = {
            format = "{:%Y-%m-%d %H:%M:%S}";
            tooltip-format = "<big>{:%B %Y}</big>\n<tt><small>{calendar}</small></tt>";
            interval = 1;
          };

          wireplumber = {
            format = "{icon}    {volume}%";
            format-muted = "";
            format-icons = ["" "" ""];
            on-click = "pavucontrol";
          };
        };
      };
    };
  };
}
