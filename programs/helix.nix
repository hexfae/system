{
  pkgs,
  inputs,
  ...
}: {
  home-manager.users.hexfae.programs.helix.enable = true;
  home-manager.users.hexfae.programs.helix.package = inputs.helix.packages."${pkgs.system}".helix;
  home-manager.users.hexfae.programs.helix.defaultEditor = true;
  home-manager.users.hexfae.programs.helix.languages.language = [
    {
      name = "rust";
      auto-format = true;
    }
    {
      name = "nix";
      auto-format = true;
      formatter.command = "${pkgs.alejandra}/bin/alejandra";
    }
  ];
  home-manager.users.hexfae.programs.helix.languages.language-server.rust-analyzer.config.check.command = "clippy";
  home-manager.users.hexfae.programs.helix.settings.editor.scrolloff = 10;
  home-manager.users.hexfae.programs.helix.settings.editor.mouse = false;
  home-manager.users.hexfae.programs.helix.settings.editor.middle-click-paste = false;
  home-manager.users.hexfae.programs.helix.settings.editor.shell = ["nu" "'--commands'"];
  home-manager.users.hexfae.programs.helix.settings.editor.line-number = "relative";
  home-manager.users.hexfae.programs.helix.settings.editor.gutters = ["diagnostics" "line-numbers" "diff"];
  home-manager.users.hexfae.programs.helix.settings.editor.idle-timeout = 0;
  home-manager.users.hexfae.programs.helix.settings.editor.preview-completion-insert = false;
  home-manager.users.hexfae.programs.helix.settings.editor.completion-trigger-len = 1;
  home-manager.users.hexfae.programs.helix.settings.editor.bufferline = "multiple";
  home-manager.users.hexfae.programs.helix.settings.editor.color-modes = true;
  home-manager.users.hexfae.programs.helix.settings.editor.statusline.left = ["mode" "file-modification-indicator" "read-only-indicator" "spinner"];
  home-manager.users.hexfae.programs.helix.settings.editor.statusline.center = ["file-name"];
  home-manager.users.hexfae.programs.helix.settings.editor.statusline.right = ["primary-selection-length" "workspace-diagnostics" "diagnostics" "position"];
  home-manager.users.hexfae.programs.helix.settings.editor.statusline.separator = "│";
  home-manager.users.hexfae.programs.helix.settings.editor.statusline.mode.normal = "N";
  home-manager.users.hexfae.programs.helix.settings.editor.statusline.mode.insert = "I";
  home-manager.users.hexfae.programs.helix.settings.editor.statusline.mode.select = "S";
  home-manager.users.hexfae.programs.helix.settings.editor.lsp.display-messages = true;
  home-manager.users.hexfae.programs.helix.settings.editor.lsp.display-inlay-hints = true;
  home-manager.users.hexfae.programs.helix.settings.editor.cursor-shape.insert = "bar";
  home-manager.users.hexfae.programs.helix.settings.editor.cursor-shape.normal = "block";
  home-manager.users.hexfae.programs.helix.settings.editor.cursor-shape.select = "underline";
  home-manager.users.hexfae.programs.helix.settings.editor.auto-pairs."(" = ")";
  home-manager.users.hexfae.programs.helix.settings.editor.auto-pairs."{" = "}";
  home-manager.users.hexfae.programs.helix.settings.editor.auto-pairs."[" = "]";
  home-manager.users.hexfae.programs.helix.settings.editor.auto-pairs."\"" = "\"";
  home-manager.users.hexfae.programs.helix.settings.editor.auto-pairs."`" = "`";
  home-manager.users.hexfae.programs.helix.settings.editor.auto-pairs."<" = ">";
  home-manager.users.hexfae.programs.helix.settings.editor.indent-guides.render = true;
  home-manager.users.hexfae.programs.helix.settings.editor.indent-guides.character = "▏";
  home-manager.users.hexfae.programs.helix.settings.editor.indent-guides.skip-levels = 1;
  home-manager.users.hexfae.programs.helix.settings.editor.soft-wrap.enable = true;
}
