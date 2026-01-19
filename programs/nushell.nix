{
  pkgs,
  lib,
  config,
  vars,
  ...
}: {
  options.huncs.programs.nushell.enable = lib.mkOption {
    type = lib.types.bool;
    default = true;
  };

  config = lib.mkIf config.huncs.programs.nushell.enable {
    users.users.${vars.username}.shell = pkgs.nushell;
    home-manager.users.${vars.username}.programs.nushell = {
      enable = true;
      settings = {
        show_banner = false;
      };
      environmentVariables."EDITOR" = "hx";
      shellAliases = {
        edit = "hx ~/nix";
        switch = "nh os switch ~/nix";
        boot = "nh os boot ~/nix";
        test = "nh os test ~/nix";
        build = "nh os build ~/nix";
        repl = "nh os repl ~/nix";
      };
    };
  };
}
