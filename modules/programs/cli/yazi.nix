{
  flake.modules.homeManager.yazi = {
    lib,
    config,
    vars,
    pkgs,
    ...
  }: {
    xdg.mimeApps = {
      associations.added."inode/directory" = ["yazi.desktop"];
      defaultApplications."inode/directory" = ["yazi.desktop"];
    };
    programs = {
      yazi = {
        enable = true;
        enableNushellIntegration = true;
        shellWrapperName = "y";
        plugins = {
          git = pkgs.yaziPlugins.git;
          jjui = pkgs.yaziPlugins.jjui;
          # rsync = pkgs.yaziPlugins.rsync;
          piper = pkgs.yaziPlugins.piper; # https://github.com/alberti42/faster-piper.yazi
          # https://github.com/Mshnwq/dupes.yazi
          # https://github.com/yazi-rs/plugins/tree/main/chmod.yazi
          # bypass = pkgs.yaziPlugins.bypass;
          # https://github.com/imsi32/yatline.yazi
          starship = pkgs.yaziPlugins.starship;
          mediainfo = pkgs.yaziPlugins.mediainfo;
          full-border = pkgs.yaziPlugins.full-border;
        };
        initLua = ''
          require("git"):setup()
          require("starship"):setup()
          require("full-border"):setup()
        '';
        keymap = {
          mgr.prepend_keymap = [
            {
              on = "A";
              run = "create --dir";
              desc = "create directory";
            }
            {
              on = ["g" "j"];
              run = "plugin jjui";
              desc = "run jjui";
            }
          ];
        };
        settings = {
          plugin = {
            prepend_preloaders = [
              {
                mime = "{audio,video,image}/*";
                run = "mediainfo";
              }
            ];
            prepend_previewers = [
              {
                mime = "{audio,video,image}/*";
                run = "mediainfo";
              }
              {
                url = "*.md";
                run = "piper -- CLICOLOR_FORCE=1 glow -w=$w -s=dark \"$1\"";
              }
            ];
            prepend_fetchers = [
              {
                id = "git";
                url = "*";
                run = "git";
              }
              {
                id = "git";
                url = "*/";
                run = "git";
              }
            ];
          };
        };
        extraPackages = with pkgs; [
          glow # markdown
          mediainfo # metadata
          # jq # json
          # poppler # pdf
          # fzf # file subtree navigation
          # resvg # svg
          # wl-clipboard # wayland clipboard
        ];
      };
    };
  };
}
