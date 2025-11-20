{
  pkgs,
  lib,
  config,
  ...
}: {
  options.huncs.programs.zed-editor.enable = lib.mkEnableOption "zed";

  config = lib.mkIf config.huncs.programs.zed-editor.enable {
    home-manager.users.hexfae.programs.zed-editor = {
      enable = true;
      # for some reason this compiles from source right now instead
      # of downloading from chaotic's nyx's binary cache
      package = pkgs.zed-editor-fhs_git;
      extraPackages = with pkgs; [nil];
      extensions = [
        "nix"
        "toml"
        "git-firefly"
        "html"
        "emmet"
      ];
      installRemoteServer = true;
      userSettings = {
        helix_mode = true;
        telemetry = {
          diagnostics = false;
          metrics = false;
        };
        languages = {
          TOML = {
            formatter = {
              external = {
                command = "${pkgs.taplo}/bin/taplo";
                arguments = ["format" "{buffer_path}"];
              };
            };
          };
          Nix = {
            language_servers = ["nil"];
            formatter = {
              external = {
                command = "${pkgs.alejandra}/bin/alejandra";
              };
            };
          };
        };
      };
    };
  };
}
