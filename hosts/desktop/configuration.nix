{
  pkgs,
  vars,
  ...
}: {
  system.stateVersion = "25.11";
  home-manager.users.${vars.username}.home = {
    stateVersion = "25.11";
    packages = [pkgs.fragments];
  };

  huncs = {
    desktops.gnome.enable = true;
    networking.wireguard.client = {
      ludd.enable = true;
      server.enable = true;
    };
    services = {
      pipewire.enable = true;
      easyeffects.enable = true;
      amberol.enable = true;
      kerberos.enable = true;
    };
    programs = {
      zen-browser.enable = true;
      discord.enable = true;
      steam.enable = true;
      ghostty.enable = true;
      zed-editor.enable = true;
      mpv.enable = true;
      obsidian.enable = true;
      telegram-desktop.enable = true;
      distrobox.enable = true;
      bottles.enable = true;
      obs-studio.enable = true;
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
