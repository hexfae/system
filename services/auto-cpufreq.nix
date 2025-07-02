{...}: {
  powerManagement.cpuFreqGovernor = "performance";
  services = {
    power-profiles-daemon.enable = false;
    auto-cpufreq = {
      enable = true;
      settings = {
        charger.governor = "performance";
        charger.turbo = "auto";
        battery.governor = "powersave";
        battery.turbo = "auto";
      };
    };
  };
  home-manager.users.hexfae.xdg.desktopEntries."auto-cpufreq-gtk" = {
    name = "auto-cpufreq";
    exec = "auto-cpufreq-gtk";
    noDisplay = true;
  };
}
