{
  pkgs,
  config,
  ...
}: {
  services.transmission.enable = true;
  services.transmission.webHome = "${pkgs.flood-for-transmission}/out";
  services.transmission.performanceNetParameters = true;
  services.transmission.package = pkgs.transmission_4;
  services.transmission.openRPCPort = true;
  services.transmission.openPeerPorts = true;
  services.transmission.settings.rpc-bind-address = "0.0.0.0";
  services.transmission.settings.download-dir = "${config.services.transmission.home}/dwn";
}
