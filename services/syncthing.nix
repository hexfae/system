{
  lib,
  config,
  vars,
  ...
}: let
  isServer = config.networking.hostName == "server";
  isDesktop = config.networking.hostName == "desktop";
  isThinkpad = config.networking.hostName == "thinkpad";
  cert-path =
    if isServer
    then ../secrets/syncthing-server-cert.age
    else if isDesktop
    then ../secrets/syncthing-desktop-cert.age
    else if isThinkpad
    then ../secrets/syncthing-thinkpad-cert.age
    else throw "no syncthing cert found for current hostname";
  key-path =
    if isServer
    then ../secrets/syncthing-server-key.age
    else if isDesktop
    then ../secrets/syncthing-desktop-key.age
    else if isThinkpad
    then ../secrets/syncthing-thinkpad-key.age
    else throw "no syncthing key found for current hostname";
  server = {
    id = "GXEMEIX-VZYYIUT-BH27PKL-GP6BH2J-ABXWAFQ-KD4YJM2-IKVPYVE-IJ4M7Q5";
    addresses = ["quic://${vars.networking.server.ip}"];
  };
  desktop.id = "76J56NK-ZJOUZ4D-ZPMF3SV-A7B6L6L-MXQGCBR-KG6Z6M3-JAG2MXL-3LOSXAX";
  thinkpad.id = "ZV5OSD3-NNBYHNU-NIHHYGY-JBQYUNQ-SOVPGHN-SZML2AI-WNPQC6F-BBDNSQR";
  devices =
    if isServer # if this is server...
    then ["desktop" "thinkpad"] # then allow desktop and thinkpad to sync this folder
    else ["server"]; # otherwise, sync this folder to server
  peers =
    if isServer # if this is server...
    then {inherit desktop thinkpad;} # then allow desktop and thinkpad to connect
    else if isDesktop || isThinkpad # if this is desktop or thinkpad...
    then {inherit server;} # then connect to server
    else throw "no syncthing devices known for current hostname";
in {
  options.huncs.services.syncthing.enable = lib.mkOption {
    type = lib.types.bool;
    default = true;
  };

  config = lib.mkIf config.huncs.services.syncthing.enable {
    age.secrets = {
      syncthing-cert = {
        file = cert-path;
        owner = vars.username;
      };
      syncthing-key = {
        file = key-path;
        owner = vars.username;
      };
    };
    services.syncthing = {
      enable = true;
      openDefaultPorts = true;
      user = vars.username;
      dataDir = "/home/${vars.username}";
      cert = config.age.secrets.syncthing-cert.path;
      key = config.age.secrets.syncthing-key.path;
      settings = {
        devices = peers;
        folders = {
          "dox" = {
            path = "~/dox";
            ignorePatterns = ["target/"];
            inherit devices;
          };
          "mus" = {
            path = "~/mus";
            inherit devices;
          };
          "pix" = {
            path = "~/pix";
            inherit devices;
          };
          "vid" = {
            path = "~/vid";
            inherit devices;
          };
        };
      };
    };
  };
}
