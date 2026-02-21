{
  flake.modules = {
    homeManager.niri = {
      pkgs,
      osConfig,
      ...
    }: let
      image = osConfig.stylix.image;
      blurred-image = pkgs.runCommand "blurred-wallpaper.png" {} ''
        ${pkgs.imagemagick}/bin/magick "${image}" -blur 0x8 $out
      '';
    in {
      programs.niri.settings.layer-rules = [
        {
          matches = [{namespace = "swww-daemonoverview$";}];
          place-within-backdrop = true;
        }
      ];
      systemd.user.services = {
        swww = {
          Unit = {
            After = ["graphical-session.target"];
            PartOf = ["graphical-session.target"];
          };
          Service = {
            ExecStart = "${pkgs.swww}/bin/swww-daemon";
            Restart = "on-failure";
          };
          Install.WantedBy = ["graphical-session.target"];
        };

        swww-overview = {
          Unit = {
            Description = "swww overview daemon";
            After = ["graphical-session.target"];
            PartOf = ["graphical-session.target"];
          };
          Service = {
            ExecStart = "${pkgs.swww}/bin/swww-daemon -n overview";
            Restart = "on-failure";
          };
          Install.WantedBy = ["graphical-session.target"];
        };

        swww-set = {
          Unit = {
            Description = "Set swww wallpaper";
            After = ["swww.service" "graphical-session.target"];
            Requires = ["swww.service"];
            PartOf = ["graphical-session.target"];
          };
          Service = {
            Type = "oneshot";
            ExecStart = "${pkgs.swww}/bin/swww img -t none ${image}";
            RemainAfterExit = true;
          };
          Install.WantedBy = ["graphical-session.target"];
        };

        swww-overview-set = {
          Unit = {
            Description = "Set swww overview wallpaper";
            After = ["swww-overview.service" "graphical-session.target"];
            Requires = ["swww-overview.service"];
            PartOf = ["graphical-session.target"];
          };
          Service = {
            Type = "oneshot";
            ExecStart = "${pkgs.swww}/bin/swww img -t none -n overview ${blurred-image}";
            RemainAfterExit = true;
          };
          Install.WantedBy = ["graphical-session.target"];
        };
      };
    };
  };
}
