{
  pkgs,
  inputs,
  lib,
  config,
  ...
}: {
  config = lib.mkIf config.huncs.programs.zen.enable {
    home-manager.users.hexfae = {
      imports = [inputs.zen-browser.homeModules.twilight];
      # TODO: psd has community support for zen via the contrib folder in the
      # repo, but needs to be manually added to the supported browsers folder?
      # services.psd = {
      #   enable = true;
      #   browsers = ["zen"];
      # };
      xdg.mimeApps.defaultApplications = {
        "text/html" = "zen-twilight.desktop";
        "x-scheme-handler/http" = "zen-twilight.desktop";
        "x-scheme-handler/https" = "zen-twilight.desktop";
        "x-scheme-handler/about" = "zen-twilight.desktop";
        "x-scheme-handler/unknown" = "zen-twilight.desktop";
      };
      programs.zen-browser = {
        enable = true;
        profiles.hexfae = {
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
              stylus
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
              "4get" = {
                urls = [{template = "https://4get.thebunny.zone/web?s={searchTerms}";}];
                icon = "https://4get.thebunny.zone/favicon.ico";
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
          settings = {
            "extensions.autoDisableScopes" = 0;
            "app.normandy.first_run" = false;
            "app.update.channel" = "default";
            "browser.ctrlTab.sortByRecentlyUsed" = true;
            "browser.tabs.loadInBackground" = true;
            "browser.urlbar.placeholderName" = "4get";
            "browser.urlbar.showSearchSuggestionsFirst" = false;
            "browser.urlbar.quickactions.enabled" = false;
            "browser.urlbar.quickactions.showPrefs" = false;
            "browser.urlbar.shortcuts.quickactions" = false;
            "browser.urlbar.suggest.quickactions" = false;
            "browser.startup.page" = 3; # open previous windows and tabs
            "browser.warnOnQuitShortcut" = false; # ctrl + q
            "browser.ml.chat.enabled" = false;
            "doh-rollout.balrog-migration-done" = true;
            "doh-rollout.doneFirstRun" = true;
            "dom.forms.autocomplete.formautofill" = false;
            "general.autoScroll" = true;
            "content.notify.interval" = 100000;
            "gfx.canvas.accelerated.cache-items" = 4096;
            "gfx.canvas.accelerated.cache-size" = 512;
            "gfx.content.skia-font-cache-size" = 20;
            "browser.cache.disk.enable" = true;
            "media.memory_cache_max_size" = 65536;
            "media.cache_readahead_limit" = 7200;
            "media.cache_resume_threshold" = 3600;
            "image.mem.decode_bytes_at_a_time" = 32768;
            "network.http.max-connections" = 1800;
            "network.http.max-persistent-connections-per-server" = 10;
            "network.http.max-urgent-start-excessive-connections-per-host" = 5;
            "network.http.pacing.requests.enabled" = false;
            "network.dnsCacheExpiration" = 3600;
            "network.ssl_tokens_cache_capacity" = 10240;
            "network.dns.disablePrefetch" = true;
            "network.dns.disablePrefetchFromHTTPS" = true;
            "network.prefetch-next" = false;
            "network.predictor.enabled" = false;
            "network.predictor.enable-prefetch" = false;
            "layout.css.grid-template-masonry-value.enabled" = true;
            "dom.enable_web_task_scheduling" = true;
            "browser.contentblocking.category" = "strict";
            "urlclassifier.trackingSkipURLs" = "*.reddit.com, *.twitter.com, *.twimg.com, *.tiktok.com";
            "urlclassifier.features.socialtracking.skipURLs" = "*.instagram.com, *.twitter.com, *.twimg.com";
            "browser.download.start_downloads_in_tmp_dir" = true;
            "browser.helperApps.deleteTempFileOnExit" = true;
            "browser.uitour.enabled" = false;
            "privacy.globalprivacycontrol.enabled" = true;
            "security.OCSP.enabled" = 0;
            "security.remote_settings.crlite_filters.enabled" = true;
            "security.pki.crlite_mode" = 2;
            "security.ssl.treat_unsafe_negotiation_as_broken" = true;
            "browser.xul.error_pages.expert_bad_cert" = true;
            "security.tls.enable_0rtt_data" = false;
            "browser.privatebrowsing.forceMediaMemoryCache" = true;
            "browser.sessionstore.interval" = 60000;
            "browser.privatebrowsing.resetPBM.enabled" = true;
            "privacy.history.custom" = true;
            "browser.urlbar.untrimOnUserInteraction.featureGate" = true;
            "browser.search.separatePrivateDefault.ui.enabled" = true;
            "browser.urlbar.update2.engineAliasRefresh" = true;
            "browser.search.suggest.enabled" = false;
            "browser.urlbar.quicksuggest.enabled" = false;
            "browser.urlbar.groupLabels.enabled" = false;
            "browser.formfill.enable" = false;
            "security.insecure_connection_text.enabled" = true;
            "security.insecure_connection_text.pbmode.enabled" = true;
            "network.IDN_show_punycode" = true;
            "dom.security.https_first" = true;
            "signon.formlessCapture.enabled" = false;
            "signon.privateBrowsingCapture.enabled" = false;
            "network.auth.subresource-http-auth-allow" = 1;
            "editor.truncate_user_pastes" = false;
            "security.mixed_content.block_display_content" = true;
            "pdfjs.enableScripting" = false;
            "extensions.enabledScopes" = 5;
            "network.http.referer.XOriginTrimmingPolicy" = 2;
            "privacy.userContext.ui.enabled" = true;
            "browser.safebrowsing.downloads.remote.enabled" = false;
            "permissions.default.desktop-notification" = 2;
            "permissions.default.geo" = 2;
            "browser.search.update" = false;
            "permissions.manager.defaultsUrl" = "";
            "datareporting.policy.dataSubmissionEnabled" = false;
            "datareporting.healthreport.uploadEnabled" = false;
            "toolkit.telemetry.unified" = false;
            "toolkit.telemetry.enabled" = false;
            "toolkit.telemetry.server" = "data:,";
            "toolkit.telemetry.archive.enabled" = false;
            "toolkit.telemetry.newProfilePing.enabled" = false;
            "toolkit.telemetry.shutdownPingSender.enabled" = false;
            "toolkit.telemetry.updatePing.enabled" = false;
            "toolkit.telemetry.bhrPing.enabled" = false;
            "toolkit.telemetry.firstShutdownPing.enabled" = false;
            "toolkit.telemetry.coverage.opt-out" = true;
            "toolkit.coverage.opt-out" = true;
            "toolkit.coverage.endpoint.base" = "";
            "browser.newtabpage.activity-stream.feeds.telemetry" = false;
            "browser.newtabpage.activity-stream.telemetry" = false;
            "app.shield.optoutstudies.enabled" = false;
            "app.normandy.enabled" = false;
            "app.normandy.api_url" = "";
            "breakpad.reportURL" = "";
            "browser.tabs.crashReporting.sendReport" = false;
            "captivedetect.canonicalURL" = "";
            "network.captive-portal-service.enabled" = false;
            "network.connectivity-service.enabled" = false;
            "browser.privatebrowsing.vpnpromourl" = "";
            "extensions.getAddons.showPane" = false;
            "extensions.htmlaboutaddons.recommendations.enabled" = false;
            "browser.discovery.enabled" = false;
            "browser.shell.checkDefaultBrowser" = false;
            "browser.newtabpage.activity-stream.asrouter.userprefs.cfr.addons" = false;
            "browser.newtabpage.activity-stream.asrouter.userprefs.cfr.features" = false;
            "browser.preferences.moreFromMozilla" = false;
            "browser.aboutConfig.showWarning" = false;
            "browser.aboutwelcome.enabled" = false;
            "browser.profiles.enabled" = true;
            "browser.compactmode.show" = true;
            "cookiebanners.service.mode" = 1;
            "cookiebanners.service.mode.privateBrowsing" = 1;
            "full-screen-api.transition-duration.enter" = "0 0";
            "full-screen-api.transition-duration.leave" = "0 0";
            "full-screen-api.warning.timeout" = 0;
            "browser.urlbar.trending.featureGate" = false;
            "browser.newtabpage.activity-stream.feeds.topsites" = false;
            "browser.newtabpage.activity-stream.showWeather" = false;
            "browser.newtabpage.activity-stream.feeds.section.topstories" = false;
            "extensions.pocket.enabled" = false;
            "browser.download.manager.addToRecentDocs" = false;
            "browser.download.open_pdf_attachments_inline" = true;
            "browser.bookmarks.openInTabClosesMenu" = false;
            "browser.menu.showViewImageInfo" = true;
            "findbar.highlightAll" = true;
            "layout.word_select.eat_space_to_next_word" = false;
            "accessibility.force_disabled" = 1;
            "browser.newtabpage.activity-stream.default.sites" = "";
            "browser.newtabpage.activity-stream.showSponsored" = false;
            "browser.newtabpage.activity-stream.showSponsoredTopSites" = false;
            "geo.provider.use_gpsd" = false;
            "geo.provider.use_geoclue" = false;
            "browser.ping-centre.telemetry" = false;
            "toolkit.telemetry.reportingpolicy.firstRun" = false;
            "toolkit.telemetry.shutdownPingSender.enabledFirstsession" = false;
            "browser.vpn_promo.enabled" = false;
            "browser.toolbars.bookmarks.visibility" = "always";
            "middlemouse.paste" = false;
            # shyfox
            "toolkit.legacyUserProfileCustomizations.stylesheets" = true;
            "sidebar.revamp" = false;
            "svg.context-properties.content.enabled" = true;
            "layout.css.has-selector.enabled" = true;
            "browser.urlbar.suggest.calculator" = true;
            "browser.urlbar.unitConversion.enabled" = true;
            "browser.urlbar.trimHttps" = true;
            "browser.urlbar.trimURLs" = true;
            "widget.gtk.rounded-bottom-corners.enabled" = true;
            "widget.gtk.ignore-bogus-leave-notify" = 1;
            # shyfox overrides
            "shyfox.larger.context.menu" = true;
            "shyfox.disable.floating.search" = true;
            "shyfox.enable.ext.mono.toolbar.icons" = true;
            "shyfox.enable.ext.mono.context.icons" = true;
            "shyfox.enable.context.menu.icons" = true;
            "shyfox.enable.context.menu.icons.native" = true;
            "shyfox.fill.accent.with.icons.fill.color" = true;
            "shyfox.force.native.controls" = true;
            # betterfox overrides
            "identity.fxaccounts.enabled" = false;
            "browser.firefox-view.feature-tour" = "{\"screen\":\"\",\"complete\":true}";
            "signon.rememberSignons" = false;
            "extensions.formautofill.addresses.enabled" = false;
            "extensions.formautofill.creditCards.enabled" = false;
            "dom.security.https_only_mode" = true;
            "dom.security.https_only_mode_error_page_user_suggestions" = true;
            "network.trr.uri" = "https://dns.nextdns.io/f43caa";
            "network.trr.mode" = 3;
            "security.cert_pinning.enforcement_level" = 2;
            "media.eme.enabled" = false;
            "browser.eme.ui.enabled" = false;
            "privacy.userContext.enabled" = true;
            # scroll
            "apz.overscroll.enabled" = true;
            "general.smoothScroll" = true;
            "general.smoothScroll.msdPhysics.continuousMotionMaxDeltaMS" = 12;
            "general.smoothScroll.msdPhysics.enabled" = true;
            "general.smoothScroll.msdPhysics.motionBeginSpringConstant" = 600;
            "general.smoothScroll.msdPhysics.regularSpringConstant" = 650;
            "general.smoothScroll.msdPhysics.slowdownMinDeltaMS" = 25;
            "general.smoothScroll.msdPhysics.slowdownMinDeltaRatio" = "2";
            "general.smoothScroll.msdPhysics.slowdownSpringConstant" = 250;
            "general.smoothScroll.currentVelocityWeighting" = "1";
            "general.smoothScroll.stopDecelerationWeighting" = "1";
            "mousewheel.default.delta_multiplier_y" = 300;
            # sine
            "general.config.obscure_value" = 0;
            "general.config.filename" = "config.js";
            "general.config.sandbox_enabled" = false;
            # zen
            "zen.workspaces.continue-where-left-off" = true;
            "zen.view.show-newtab-button-top" = false;
            "zen.view.show-newtab-button-border-top" = true;
          };
        };
      };
    };
  };
}
