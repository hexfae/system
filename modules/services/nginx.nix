{inputs, ...}: {
  flake-file.inputs.hexfaedotdev = {
    url = "github:hexfae/hexfae.dev";
    flake = false;
  };
  flake.modules.nixos.nginx = {
    config,
    pkgs,
    ...
  }: {
    networking.firewall = {
      allowedTCPPorts = [80 443];
      allowedUDPPorts = [443];
    };

    security.acme = {
      acceptTerms = true;
      defaults.email = config.constants.email;
    };

    systemd.tmpfiles.rules = ["d /var/www/serve.hexfae.dev 0755 nginx nginx"];

    services.nginx = {
      enable = true;

      package = pkgs.angie;

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

      virtualHosts."serve.hexfae.dev" = {
        enableACME = true;
        forceSSL = true;
        quic = true;

        root = "/var/www/serve.hexfae.dev";
      };
    };
  };
}
