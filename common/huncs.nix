{lib, ...}: {
  options.huncs = {
    desktops = {
      niri.enable = lib.mkEnableOption "niri";
      gnome.enable = lib.mkEnableOption "gnome";
      hyprland.enable = lib.mkEnableOption "hyprland";
    };
    services = {
      ssh.enable = lib.mkEnableOption "ssh";
      swww.enable = lib.mkEnableOption "swww";
      harry.enable = lib.mkEnableOption "harry";
      mullvad.enable = lib.mkEnableOption "mullvad";
      openrgb.enable = lib.mkEnableOption "openrgb";
      pipewire.enable = lib.mkEnableOption "pipewire";
      syncthing.enable = lib.mkEnableOption "syncthing";
      auto-cpufreq.enable = lib.mkEnableOption "auto-cpufreq";
      transmission.enable = lib.mkEnableOption "transmission";
      home-assistant.enable = lib.mkEnableOption "home-assistant";
      virtualization.enable = lib.mkEnableOption "virtualization";
    };
    programs = {
      adb.enable = lib.mkEnableOption "adb";
      bat.enable = lib.mkEnableOption "bat";
      distrobox.enable = lib.mkEnableOption "distrobox";
      fd.enable = lib.mkEnableOption "fd";
      ghostty.enable = lib.mkEnableOption "ghostty";
      git.enable = lib.mkEnableOption "git";
      helix.enable = lib.mkEnableOption "helix";
      nh.enable = lib.mkEnableOption "nh";
      nushell.enable = lib.mkEnableOption "nushell";
      obs.enable = lib.mkEnableOption "obs";
      ripgrep-all.enable = lib.mkEnableOption "ripgrep";
      starship.enable = lib.mkEnableOption "starship";
      steam.enable = lib.mkEnableOption "steam";
      vesktop.enable = lib.mkEnableOption "vesktop";
      waybar.enable = lib.mkEnableOption "waybar";
      zed-editor.enable = lib.mkEnableOption "zed-editor";
      zellij.enable = lib.mkEnableOption "zellij";
      zen.enable = lib.mkEnableOption "zen";
      zoxide.enable = lib.mkEnableOption "zoxide";
    };
  };
}
