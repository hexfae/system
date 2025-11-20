{...}: {
  system.stateVersion = "25.11";
  home-manager.users.hexfae.home.stateVersion = "25.11";

  huncs = {
    hardware.amd-cpu.enable = true;
    desktops.gnome.enable = true;
    services = {
      pipewire.enable = true;
      mysql.enable = true;
      docker.enable = true;
      easyeffects.enable = true;
      amberol.enable = true;
    };
    programs = {
      vesktop.enable = true;
      steam.enable = true;
      ghostty.enable = true;
      zed-editor.enable = true;
      mpv.enable = true;
      obsidian.enable = true;
    };
  };

  # TODO: to check out from chaotic's nyx:
  # discord-krisp
  # all of the jovian packages
  # jujutsu
  # linuxPackages_cachyos-server / linux_cachyos-server for server
  # latencyflex
  # niri_git
  # mangohud
  # nix_git
  # openrgb_git
  # proton-cachyos
  # proton-ge-custom
  # pwvucontrol-git
  # xdg-desktop-portal
  # yt-dlp
  # zfs-cachyos
}
