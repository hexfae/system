{
  flake.modules.nixos.kerberos.security.krb5 = {
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
}
