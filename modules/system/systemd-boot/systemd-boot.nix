{
  flake.modules.nixos.systemd-boot.boot = {
    initrd.systemd.enable = true;
    loader = {
      timeout = 0;
      efi.canTouchEfiVariables = true;
      systemd-boot = {
        enable = true;
        configurationLimit = 10;
      };
    };
  };
}
