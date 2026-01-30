{
  pkgs,
  inputs,
  lib,
  config,
  vars,
  ...
}: {
  options.huncs.programs.zen-browser.enable = lib.mkEnableOption "zen-browser";

  config = lib.mkIf config.huncs.programs.zen-browser.enable {
    nixpkgs.overlays = [inputs.nur.overlays.default];
    home-manager.users.${vars.username} = {
      imports = [inputs.zen-browser.homeModules.twilight];
      programs.zen-browser = {
        enable = true;
        profiles.${vars.username} = {
          settings = {
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
          extensions = {
            force = true;
            packages = with pkgs.nur.repos.rycee.firefox-addons; [
              ublock-origin
              proton-pass
              gnome-shell-integration
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
          search = {
            force = true;
            default = "4get";
            privateDefault = "google";
            order = ["4get" "Nix Packages" "Nix Options" "Nix Wiki" "Nix Home Manager Options" "Github" "Rust Standard Library" "Rust Libraries" "google" "Google Images"];
            engines = {
              google.metaData.alias = "!g";
              bing.metaData.hidden = true;
              ddg.metaData.hidden = true;
              wikipedia.metaData.hidden = true;
              ecosia.metaData.hidden = true;
              perplexity.metaData.hidden = true;
              "4get" = {
                urls = [{template = "https://4get.lunar.icu/web?s={searchTerms}";}];
                icon = "https://4get.lunar.icu/favicon.ico";
              };
              "Nix Packages" = {
                urls = [{template = "https://search.nixos.org/packages?type=packages&channel=unstable&query={searchTerms}";}];
                icon = "${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflake.svg";
                definedAliases = ["!np"];
              };
              "NixOS Options" = {
                urls = [{template = "https://search.nixos.org/options?channel=unstable&query={searchTerms}";}];
                icon = "${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflake.svg";
                definedAliases = ["!no"];
              };
              "NixOS Wiki" = {
                urls = [{template = "https://wiki.nixos.org/w/index.php?search={searchTerms}";}];
                icon = "${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflake.svg";
                definedAliases = ["!nw"];
              };
              "Home Manager Options" = {
                urls = [{template = "https://home-manager-options.extranix.com/?release=master&query={searchTerms}";}];
                icon = "${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflake.svg";
                definedAliases = ["!ho"];
              };
              "Arch Linux Wiki" = {
                urls = [{template = "https://wiki.archlinux.org/index.php?search={searchTerms}";}];
                icon = "https://wiki.archlinux.org/favicon.ico";
                definedAliases = ["!aw"];
              };
              "Github" = {
                urls = [{template = "https://github.com/search?type=repositories&q={searchTerms}";}];
                icon = "https://github.com/favicon.ico";
                definedAliases = ["!gh"];
              };
              "Minecraft Wiki" = {
                urls = [{template = "https://minecraft.wiki/?search={searchTerms}";}];
                icon = "https://minecraft.wiki/favicon.ico";
                definedAliases = ["!mc"];
              };
              "Rust Standard Library" = {
                urls = [{template = "https://doc.rust-lang.org/std/?search={searchTerms}";}];
                icon = "https://rust-lang.org/static/images/favicon.ico";
                definedAliases = ["!std"];
              };
              "Rust Libraries" = {
                urls = [{template = "https://lib.rs/search?q={searchTerms}";}];
                icon = "https://lib.rs/favicon.ico";
                definedAliases = ["!lib"];
              };
              "Google Images" = {
                urls = [{template = "https://google.com/search?udm=2&q={searchTerms}";}];
                icon = "https://google.com/favicon.ico";
                definedAliases = ["!gi"];
              };
              "Youtube" = {
                urls = [{template = "https://youtube.com/results?search_query={searchTerms}";}];
                icon = "https://youtube.com/favicon.ico";
                definedAliases = ["!yt"];
              };
              "SoundCloud" = {
                urls = [{template = "https://soundcloud.com/search?q={searchTerms}";}];
                icon = "https://soundcloud.com/favicon.ico";
                definedAliases = ["!sc"];
              };
            };
          };
        };
      };
    };
  };
}
