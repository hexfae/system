{
  flake.modules.homeManager.yt-dlp.programs.yt-dlp = {
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
}
