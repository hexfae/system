{...}: {
  networking.hostName = "desktop";
  system.stateVersion = "25.11";
  home-manager.users.hexfae.home.stateVersion = "25.11";

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
}
