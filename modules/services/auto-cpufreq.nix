{inputs, ...}: {
  flake.modules = {
    nixos.auto-cpufreq = {
      home-manager.sharedModules = [inputs.self.modules.homeManager.auto-cpufreq];
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
    };
    homeManager.auto-cpufreq.xdg.desktopEntries."auto-cpufreq-gtk" = {
      name = "auto-cpufreq";
      exec = "auto-cpufreq-gtk";
      noDisplay = true;
    };
  };
}
