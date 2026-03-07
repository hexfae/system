{
  flake.modules.nixos.nix-ld = {pkgs, ...}: {
    programs.nix-ld = {
      enable = true;
      libraries = with pkgs; [
        stdenv.cc.cc
        zlib
        openssl
        curl
        glib
        util-linux
        icu
        libunwind
        libuuid
      ];
    };
  };
}
