{pkgs, ...}: {
  # boot.kernelPackages = pkgs.linuxPackages_lqx;
  services.xserver.videoDrivers = ["amdgpu"];
  services.libinput.mouse.accelProfile = "flat";
  hardware.enableAllFirmware = true;
  hardware.graphics.enable = true;
  hardware.graphics.enable32Bit = true;
  boot.kernelPackages = pkgs.linuxPackages_zen;
  services.power-profiles-daemon.enable = false;
  services.auto-cpufreq.enable = true;
  services.auto-cpufreq.settings.charger.governor = "performance";
  services.auto-cpufreq.settings.charger.turbo = "auto";
  services.auto-cpufreq.settings.battery.governor = "powersave";
  services.auto-cpufreq.settings.battery.turbo = "auto";
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
  # programs.gnupg.agent.enable = true;
  # programs.gnupg.agent.enableSSHSupport = true;
  # services.flatpak.enable = true;
  # virtualisation.podman.enable = true;
  # virtualisation.podman.dockerCompat = true;
}