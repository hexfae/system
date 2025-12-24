{
  lib,
  config,
  vars,
  ...
}: {
  options.huncs.programs.nh.enable = lib.mkOption {
    type = lib.types.bool;
    default = true;
  };

  config = lib.mkIf config.huncs.programs.nh.enable {
    home-manager.users.${vars.username}.programs.nh = {
      enable = true;
      flake = /home/${vars.username}/nix;
      clean = {
        enable = true;
        extraArgs = "--keep 10 --keep-since 7d";
      };
    };
  };
}
