{
  flake.modules.homeManager.zen-browser = {
    config,
    pkgs,
    ...
  }: {
    programs.zen-browser.profiles.${config.constants.username}.search = {
      force = true;
      default = "4get";
      privateDefault = "google";
      order = ["4get" "Nix Packages" "Nix Options" "Nix Wiki" "Nix Home Manager Options" "Github" "Modrinth Mods" "Rust Standard Library" "Rust Libraries" "google" "Google Images"];
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
        "Modrinth Mods" = {
          urls = [{template = "https://modrinth.com/discover/mods?q={searchTerms}";}];
          icon = "https://modrinth.com/favicon.ico";
          definedAliases = ["!mrm"];
        };
        "Modrinth Resource Packs" = {
          urls = [{template = "https://modrinth.com/discover/resourcepacks?q={searchTerms}";}];
          icon = "https://modrinth.com/favicon.ico";
          definedAliases = ["!mrr"];
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
}
