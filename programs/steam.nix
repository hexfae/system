{
  pkgs,
  lib,
  config,
  ...
}: {
  options.huncs.programs.steam.enable = lib.mkEnableOption "steam";

  config = lib.mkIf config.huncs.programs.steam.enable {
    programs.steam = {
      enable = true;
      extraCompatPackages = [pkgs.proton-ge-bin];
      extest.enable = true;
      remotePlay.openFirewall = true;
      dedicatedServer.openFirewall = true;
      localNetworkGameTransfers.openFirewall = true;
    };
  };
}
