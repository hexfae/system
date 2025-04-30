{...}: {
  systemd = {
    network.wait-online.enable = false;
    services.NetworkManager-wait-online.enable = false;
  };
  services.journald.extraConfig = "SystemMaxUse=10M";
  boot = {
    plymouth.enable = true;
    tmp.cleanOnBoot = true;
    kernelParams = ["quiet"];
    initrd = {
      compressor = "cat";
      verbose = false;
      systemd.enable = true;
    };
    loader = {
      timeout = 0;
      efi.canTouchEfiVariables = true;
      systemd-boot = {
        enable = true;
        editor = false;
        configurationLimit = 10;
      };
    };
  };
}
