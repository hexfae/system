{
  pkgs,
  lib,
  config,
  ...
}: {
  config = lib.mkIf config.huncs.services.mullvad.enable {
    services.mullvad-vpn = {
      enable = true;
      package = pkgs.mullvad-vpn;
      enableExcludeWrapper = false;
    };
  };
}
