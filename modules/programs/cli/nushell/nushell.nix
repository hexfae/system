{inputs, ...}: {
  flake.modules = {
    nixos.nushell = {
      pkgs,
      config,
      ...
    }: {
      users.users.${config.constants.username}.shell = pkgs.nushell;
      home-manager.sharedModules = [inputs.self.modules.homeManager.nushell];
    };
    homeManager.nushell = {
      pkgs,
      lib,
      config,
      ...
    }: let
      jujutsuEnabled = config.programs.jujutsu.enable;
      helixEnabled = config.programs.helix.enable;
      nhEnabled = config.programs.nh.enable;
      nh = pkgs.nh + /bin/nh;
      helix = pkgs.helix + /bin/hx;
      nixDir = config.constants.nixDir;
    in {
      xdg.configFile."nushell/completions-jj.nu".source = lib.mkIf jujutsuEnabled (pkgs.runCommand "jj-nu-completions" {} ''
        ${pkgs.jujutsu}/bin/jj util completion nushell > $out
      '');
      programs = {
        ghostty.settings.command = pkgs.nushell + /bin/nu;
        nushell = {
          enable = true;
          settings = {
            show_banner = false;
            cursor_shape.emacs = "line";
          };
          extraConfig = lib.mkIf jujutsuEnabled "use completions-jj.nu *";
          shellAliases = {
            edit = lib.mkIf helixEnabled "${helix} ${nixDir}";
            switch = lib.mkIf nhEnabled "${nh} os switch ${nixDir}";
            boot = lib.mkIf nhEnabled "${nh} os boot ${nixDir}";
            test = lib.mkIf nhEnabled "${nh} os test ${nixDir}";
            build = lib.mkIf nhEnabled "${nh} os build ${nixDir}";
            repl = lib.mkIf nhEnabled "${nh} os repl ${nixDir}";
            search = lib.mkIf nhEnabled "${nh} search";
          };
        };
      };
    };
  };
}
