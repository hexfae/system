{
  lib,
  config,
  vars,
  ...
}: {
  options.huncs.services.auto-cpufreq.enable = lib.mkOption {
    type = lib.types.bool;
    default = true;
  };

  config = lib.mkIf config.huncs.services.auto-cpufreq.enable {
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
    home-manager.users.${vars.username}.xdg.desktopEntries."auto-cpufreq-gtk" = {
      name = "auto-cpufreq";
      exec = "auto-cpufreq-gtk";
      noDisplay = true;
    };
  };
}
