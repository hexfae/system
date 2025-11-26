{
  lib,
  config,
  ...
}: {
  options.huncs.services.kerberos.enable = lib.mkEnableOption "kerberos";

  config = lib.mkIf config.huncs.services.kerberos.enable {
    security.krb5 = {
      enable = true;
      settings = {
        libdefaults = {
          rdns = false;
        };
        domain_realm = {
          "ludd.ltu.se" = "LUDD.LTU.SE";
          ".ludd.ltu.se" = "LUDD.LTU.SE";
        };
      };
    };
  };
}
