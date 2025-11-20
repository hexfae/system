{
  pkgs,
  lib,
  config,
  ...
}: {
  options.huncs.programs.nushell.enable = lib.mkOption {
    type = lib.types.bool;
    default = true;
  };

  config = lib.mkIf config.huncs.programs.nushell.enable {
    users.users.hexfae.shell = pkgs.nushell;
    home-manager.users.hexfae.programs.nushell = {
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
      };
      extraConfig = ''
        # turn e.g. `nix run blender` into `nix run nixpkgs#blender`
        def "nix run" [...args] {
            if (($args | length) == 1) and not ($args | get 0 | str contains "#") and not ($args | get 0 | str contains ":") {
              ^nix run $"nixpkgs#($args | get 0)"
          } else {
              ^nix run ...$args
          }
        }
        # same as above but for `nix shell`
        def "nix shell" [...args] {
            if (($args | length) == 1) and not ($args | get 0 | str contains "#") and not ($args | get 0 | str contains ":") {
              ^nix shell $"nixpkgs#($args | get 0)"
          } else {
              ^nix shell ...$args
          }
        }
        # autostart niri on tty1
        if (not ("DISPLAY" in $env) and not ("WAYLAND_DISPLAY" in $env) and (tty) == "/dev/tty1") {
          exec niri-session
        }
      '';
    };
  };
}
