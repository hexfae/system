{...}: {
  home-manager.users.hexfae.programs.waybar = {
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
        modules-right = ["tray" "pulseaudio" "network" "cpu" "memory"];

        tray = {
          icon-size = 16;
          spacing = 10;
        };

        clock = {
          format = "{:%Y-%m-%d %H:%M:%S}";
          tooltip-format = "<big>{:%B %Y}</big>\n<tt><small>{calendar}</small></tt>";
          interval = 1;
        };

        cpu = {
          format = "CPU: {usage}% ";
          tooltip = true;
          interval = 1;
        };

        memory = {
          format = "MEM: {}%";
          interval = 1;
        };

        network = {
          format-wifi = "";
          format-ethernet = "{ifname}: {ipaddr}/{cidr} ";
          format-disconnected = "Disconnected ⚠";
        };

        pulseaudio = {
          format = "{volume}% {icon}";
          format-bluetooth = "{volume}% {icon}";
          format-muted = "";
          on-click = "pavucontrol";
        };
      };
    };
  };
}
