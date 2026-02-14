{inputs, ...}: {
  flake.modules = {
    nixos.constants = {lib, ...}: {
      imports = [inputs.self.modules.generic.constants];
      home-manager.sharedModules = [inputs.self.modules.homeManager.constants];
    };
    homeManager.constants.imports = [inputs.self.modules.generic.constants];
    generic.constants = {
      lib,
      config,
      ...
    }: let
      desktop.id = "76J56NK-ZJOUZ4D-ZPMF3SV-A7B6L6L-MXQGCBR-KG6Z6M3-JAG2MXL-3LOSXAX";
      thinkpad.id = "ZV5OSD3-NNBYHNU-NIHHYGY-JBQYUNQ-SOVPGHN-SZML2AI-WNPQC6F-BBDNSQR";
      phone.id = "2N72XWL-5CK7PQL-L3FWHRW-KF3Z5GC-JKML76J-VNVGUEG-BOVJZHY-6K5ZRQP";
      server = {
        id = "GXEMEIX-VZYYIUT-BH27PKL-GP6BH2J-ABXWAFQ-KD4YJM2-IKVPYVE-IJ4M7Q5";
        addresses = ["quic://${config.constants.networking.server.ip}"];
      };
    in {
      options.constants = lib.mkOption {
        type = lib.types.attrsOf lib.types.unspecified;
        default = {};
      };

      config.constants = {
        username = "hexfae";
        email = "hexfae@proton.me";
        home = "/home/hexfae";
        nixDir = "/home/hexfae/nix";
        keys = import (inputs.self + /secrets/keys.nix);
        syncthing = {
          cert-path = inputs.self + /secrets/syncthing/${config.networking.hostName}-cert.age;
          key-path = inputs.self + /secrets/syncthing/${config.networking.hostName}-key.age;
          devicesForServer = ["desktop" "thinkpad" "phone"];
          devicesServer = ["server"];
          devices = lib.mkDefault config.constants.syncthing.devicesServer;
          peersForServer = {inherit desktop thinkpad phone;};
          peersServer = {inherit server;};
          peers = lib.mkDefault config.constants.syncthing.peersServer;
        };
        networking = {
          server = {
            ip = "129.151.192.240";
            port = 51820;
            endpoint = "${config.constants.networking.server.ip}:${toString config.constants.networking.server.port}";
            wgIp = "10.100.0.1/24";
            allowedIPs = ["10.100.0.0/24"];
            publicKey = "QXjD222mBO0VVz1ZiChRfAgeZmU3B5Az99R8N/soYk4=";
          };
          desktop = {
            ip = "10.100.0.2";
            wgIp = "${config.constants.networking.desktop.ip}/24";
            allowedIPs = ["${config.constants.networking.desktop.ip}/32"];
            publicKey = "ArMsMaebYbsZ1tEaW4xnyjniCOGsWPvWbaeCwCIwiHk=";
          };
          phone = {
            ip = "10.100.0.3";
            wgIp = "${config.constants.networking.phone.ip}/24";
            allowedIPs = ["${config.constants.networking.phone.ip}/32"];
            publicKey = "MB8cQUyUsUIlR5i2WjgtWib0PhIRNSV5vCbWxDM0fyw=";
          };
          ludd = {
            endpoint = "130.240.22.206:51820";
            wgIp = "192.168.69.17/32";
            publicKey = "CkHERo9J8Kz4UxtZRXx3JhQpb8jfxeqBxdbkMGp3piE=";
            allowedIPs = [
              "10.30.0.0/16"
              "10.10.0.0/16"
              "192.168.42.0/24"
              "10.30.104.0/21"
            ];
          };
        };
      };
    };
  };
}
