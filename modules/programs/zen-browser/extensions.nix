{
  flake.modules.homeManager.zen-browser = {
    config,
    pkgs,
    ...
  }: {
    programs.zen-browser.profiles.${config.constants.username}.settings.extensions = {
      force = true;
      packages = with pkgs.nur.repos.rycee.firefox-addons; [
        ublock-origin
        proton-pass
        sponsorblock
        return-youtube-dislikes
        videospeed
        enhanced-github
        downthemall
        # stylus
      ];
      settings = {
        # "{3c078156-979c-498b-8990-85f7987dd929}" = {};
        # "uBlock0@raymondhill.net" = {};
      };
    };
  };
}
