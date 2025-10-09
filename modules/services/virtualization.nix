{
  pkgs,
  lib,
  config,
  ...
}: {
  config = lib.mkIf config.huncs.services.virtualization.enable {
    virtualisation.libvirtd = {
      enable = true;
      qemu = {
        package = pkgs.qemu_kvm;
        runAsRoot = true;
        swtpm.enable = true;
        ovmf = {
          enable = true;
          packages = [
            (pkgs.OVMF.override {
              secureBoot = true;
              tpmSupport = true;
            })
          .fd
          ];
        };
      };
    };
  };
}
