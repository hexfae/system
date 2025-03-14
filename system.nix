{pkgs, ...}: {
  services.xserver.videoDrivers = ["amdgpu"];
  services.libinput.mouse.accelProfile = "flat";
  programs.adb.enable = true;
  users.users.hexfae.extraGroups = ["adbusers"];
  hardware.enableAllFirmware = true;
  hardware.graphics.enable = true;
  hardware.graphics.enable32Bit = true;
  hardware.cpu.amd.updateMicrocode = true;
  hardware.enableRedistributableFirmware = true;
  hardware.amdgpu.initrd.enable = true;
  boot.kernelPackages = pkgs.linuxPackages_zen;
  boot.supportedFilesystems = ["bcachefs"];
  services.power-profiles-daemon.enable = false;
  services.auto-cpufreq.enable = true;
  services.auto-cpufreq.settings.charger.governor = "performance";
  services.auto-cpufreq.settings.charger.turbo = "auto";
  services.auto-cpufreq.settings.battery.governor = "powersave";
  services.auto-cpufreq.settings.battery.turbo = "auto";
  virtualisation.podman.enable = true;
  virtualisation.podman.dockerCompat = true;
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
  powerManagement.cpuFreqGovernor = "performance";
  programs.gamemode.enable = true;
  security.sudo.wheelNeedsPassword = false;
  security.rtkit.enable = true;
  services.dbus.enable = true;
  services.dbus.implementation = "broker";
  services.searx.enable = true;
  services.searx.settings.server.secret_key = "";
  services.mullvad-vpn.enable = true;
  services.mullvad-vpn.package = pkgs.mullvad-vpn;
  services.mullvad-vpn.enableExcludeWrapper = false;
  services.flatpak.enable = true;
}
