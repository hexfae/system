{inputs, ...}: {
  flake.modules = {
    nixos.zed-editor.home-manager.sharedModules = [inputs.self.modules.homeManager.zed-editor];
    homeManager.zed-editor = {pkgs, ...}: {
      programs.zed-editor = {
        enable = true;
        package = pkgs.zed-editor-fhs;
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
  };
}
