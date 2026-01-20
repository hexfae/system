{
  lib,
  config,
  vars,
  ...
}: {
  options.huncs.programs.yt-dlp.enable = lib.mkOption {
    type = lib.types.bool;
    default = true;
  };

  config = lib.mkIf config.huncs.programs.yt-dlp.enable {
    home-manager.users.${vars.username}.programs.yt-dlp = {
      enable = true;
      settings = {
        add-metadata = true;
        downloader = "aria2c";
        downloader-args = "aria2c:'-c -x8 -s8 -k1M'";
        embed-chapters = true;
        embed-info-json = true;
        embed-subs = true;
        embed-thumbnail = true;
        sub-langs = "all";
      };
    };
  };
}
