{pkgs, ...}: {
  system.stateVersion = "25.11";
  networking.hostName = "desktop";

  huncs = {
    desktops.niri.enable = true;
    services = {
      ssh.enable = true;
      auto-cpufreq.enable = true;
      openrgb.enable = true;
    };
    programs = {
      adb.enable = true;
      bat.enable = true;
      fd.enable = true;
      ghostty.enable = true;
      git.enable = true;
      helix.enable = true;
      nh.enable = true;
      nushell.enable = true;
      obs.enable = true;
      ripgrep-all.enable = true;
      starship.enable = true;
      steam.enable = true;
      vesktop.enable = true;
      zed-editor.enable = true;
      zellij.enable = true;
      zen.enable = true;
      zoxide.enable = true;
    };
  };

  boot.initrd.kernelModules = [
    "amdgpu" # gpu
    "r8169" # ethernet
    "mt7921e" # wifi
  ];
  boot.kernelModules = [
    "amdgpu" # gpu
    "r8169" # ethernet
    "mt7921e" # wifi
  ];
  services.xserver.videoDrivers = ["amdgpu"];

  systemd.tmpfiles.rules = [
    "L+    /opt/rocm/hip   -    -    -     -    ${pkgs.rocmPackages.clr}"
  ];
  hardware.graphics.extraPackages = with pkgs; [
    rocmPackages.clr.icd
    amdvlk
  ];
  hardware.graphics.extraPackages32 = with pkgs; [
    driversi686Linux.amdvlk
  ];
}
