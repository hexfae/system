{...}: {
  services.power-profiles-daemon.enable = false;
  services.auto-cpufreq.enable = true;
  services.auto-cpufreq.settings.charger.governor = "performance";
  services.auto-cpufreq.settings.charger.turbo = "auto";
  services.auto-cpufreq.settings.battery.governor = "powersave";
  services.auto-cpufreq.settings.battery.turbo = "auto";
  powerManagement.cpuFreqGovernor = "performance";
}
