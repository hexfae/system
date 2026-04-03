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
          matches = [{namespace = "awww-daemonoverview$";}];
          place-within-backdrop = true;
        }
      ];
      systemd.user.services = {
        awww = {
          Unit = {
            After = ["graphical-session.target"];
            PartOf = ["graphical-session.target"];
          };
          Service = {
            ExecStart = "${pkgs.awww}/bin/awww-daemon";
            Restart = "on-failure";
          };
          Install.WantedBy = ["graphical-session.target"];
        };

        awww-overview = {
          Unit = {
            Description = "awww overview daemon";
            After = ["graphical-session.target"];
            PartOf = ["graphical-session.target"];
          };
          Service = {
            ExecStart = "${pkgs.awww}/bin/awww-daemon -n overview";
            Restart = "on-failure";
          };
          Install.WantedBy = ["graphical-session.target"];
        };

        awww-set = {
          Unit = {
            Description = "Set awww wallpaper";
            After = ["awww.service" "graphical-session.target"];
            Requires = ["awww.service"];
            PartOf = ["graphical-session.target"];
          };
          Service = {
            Type = "oneshot";
            ExecStart = "${pkgs.awww}/bin/awww img -t none ${image}";
            RemainAfterExit = true;
          };
          Install.WantedBy = ["graphical-session.target"];
        };

        awww-overview-set = {
          Unit = {
            Description = "Set awww overview wallpaper";
            After = ["awww-overview.service" "graphical-session.target"];
            Requires = ["awww-overview.service"];
            PartOf = ["graphical-session.target"];
          };
          Service = {
            Type = "oneshot";
            ExecStart = "${pkgs.awww}/bin/awww img -t none -n overview ${blurred-image}";
            RemainAfterExit = true;
          };
          Install.WantedBy = ["graphical-session.target"];
        };
      };
    };
  };
}
