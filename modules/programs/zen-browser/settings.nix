{
  flake.modules.homeManager.zen-browser = {config, ...}: {
    programs.zen-browser.profiles.${config.constants.username}.settings = {
      "middlemouse.paste" = false;
      "general.autoScroll" = true;
      "signon.rememberSignons" = false;
      "browser.aboutConfig.showWarning" = false;
      "browser.ctrlTab.sortByRecentlyUsed" = true;
      "browser.warnOnQuitShortcut" = false;
      "zen.welcome-screen.seen" = true;
      "zen.workspaces.continue-where-left-off" = true;
      "zen.view.show-newtab-button-top" = false;
      "network.negotitate-auth.allow-non-fqdn" = true;
      "network.negotitate-auth.delegation-uris" = "ludd.ltu.se";
      "network.negotiate-auth.trusted-uris" = "ludd.ltu.se,.ludd.ltu.se";
    };
  };
}
