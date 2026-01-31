{
  lib,
  pkgs,
  vars,
  ...
}: {
  system.stateVersion = "25.11";
  home-manager.users.${vars.username}.home.stateVersion = "25.11";

  age.identityPaths = ["/home/hexfae/.ssh/id_ed25519"];
  services.openssh.generateHostKeys = false;
  systemd.tmpfiles.rules = [
    "d /home/${vars.username}/.config/obsidian 755 ${vars.username} users"
    "d /home/${vars.username}/.config 755 ${vars.username} users"
  ];
  systemd.tmpfiles.settings.preservation."/home/hexfae/.config".d = {
    user = vars.username;
    group = "users";
    mode = "0755";
  };
  services.zfs.autoScrub.enable = true;

  users.users.root.password = "pass";
  services.getty.autologinUser = "root";
  boot.kernelPackages = lib.mkForce pkgs.linuxPackages_xanmod_latest;

  huncs = {
    desktops.gnome.enable = true;
    networking.wireguard.client = {
      ludd.enable = true;
      server.enable = true;
    };
    services = {
      pipewire.enable = true;
      easyeffects.enable = true;
      kerberos.enable = true;
    };
    programs = {
      zen-browser.enable = true;
      discord.enable = true;
      steam.enable = true;
      ghostty.enable = true;
      zed-editor.enable = true;
      mpv.enable = true;
      qimgv.enable = true;
      obsidian.enable = true;
      telegram-desktop.enable = true;
      distrobox.enable = true;
      bottles.enable = true;
      obs-studio.enable = true;
    };
  };
}
