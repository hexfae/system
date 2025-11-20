{
  lib,
  config,
  ...
}: {
  options.huncs.programs.fd.enable = lib.mkOption {
    type = lib.types.bool;
    default = true;
  };

  config = lib.mkIf config.huncs.programs.fd.enable {
    home-manager.users.hexfae.programs.fd = {
      enable = true;
      hidden = true;
    };
  };
}
