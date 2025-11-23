{
  lib,
  config,
  pkgs,
  inputs,
  ...
}: {
  options.huncs.services.nginx.enable = lib.mkEnableOption "nginx";

  config = lib.mkIf config.huncs.services.nginx.enable {
    networking.firewall.allowedTCPPorts = [80 443];
    networking.firewall.allowedUDPPorts = [443];

    security.acme = {
      acceptTerms = true;
      defaults.email = "hexfae@proton.me";
    };

    services.nginx = {
      enable = true;

      package = pkgs.nginxQuic;

      recommendedGzipSettings = true;
      recommendedOptimisation = true;
      recommendedTlsSettings = true;

      recommendedUwsgiSettings = true;
      recommendedProxySettings = true;
      recommendedBrotliSettings = true;

      virtualHosts."hexfae.dev" = {
        enableACME = true;
        forceSSL = true;
        quic = true;

        root = "${inputs.hexfaedotdev}/files";
      };
    };
  };
}
