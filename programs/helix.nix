{
  pkgs,
  lib,
  config,
  vars,
  ...
}: {
  options.huncs.programs.helix.enable = lib.mkOption {
    type = lib.types.bool;
    default = true;
  };

  config = lib.mkIf config.huncs.programs.helix.enable {
    home-manager.users.${vars.username} = {
      xdg.desktopEntries."Helix" = {
        name = "Helix";
        exec = "helix";
        noDisplay = true;
      };
      home.packages = with pkgs; [
        bacon
        nil
        alejandra
        taplo
      ];
      programs.helix = {
        enable = true;
        defaultEditor = true;
        extraPackages = with pkgs; [nil alejandra taplo];
        languages = {
          language = [
            {
              name = "rust";
              auto-format = true;
            }
            {
              name = "nix";
              auto-format = true;
              formatter.command = "${pkgs.alejandra}/bin/alejandra";
            }
            {
              name = "toml";
              auto-format = true;
            }
          ];
          language-server.rust-analyzer.config.check.command = "clippy";
        };
        settings.editor = {
          scrolloff = 10;
          mouse = false;
          middle-click-paste = false;
          shell = ["nu" "'--commands'"];
          line-number = "relative";
          gutters = ["diagnostics" "line-numbers" "diff"];
          idle-timeout = 0;
          preview-completion-insert = false;
          completion-trigger-len = 1;
          bufferline = "multiple";
          color-modes = true;
          soft-wrap.enable = true;
          lsp = {
            display-messages = true;
            display-inlay-hints = true;
          };
          cursor-shape = {
            insert = "bar";
            normal = "block";
            select = "underline";
          };
          indent-guides = {
            render = true;
            character = "▏";
            skip-levels = 1;
          };
          auto-pairs = {
            "(" = ")";
            "{" = "}";
            "[" = "]";
            "\"" = "\"";
            "`" = "`";
            "<" = ">";
          };
          statusline = {
            left = ["mode" "file-modification-indicator" "read-only-indicator" "spinner"];
            center = ["file-name"];
            right = ["primary-selection-length" "workspace-diagnostics" "diagnostics" "position"];
            separator = "│";
            mode = {
              normal = "N";
              insert = "I";
              select = "S";
            };
          };
        };
      };
    };
  };
}
