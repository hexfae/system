{inputs, ...}: {
  flake.modules.nixos.desktop = {config, ...}: {
    networking.hostId = "611d21b4";
    system.stateVersion = "25.11";
    home-manager.users.${config.constants.username}.home.stateVersion = "25.11";
    imports = with inputs.self.modules.nixos; [
      user

      agenix
      # ananicy
      constants
      disko
      emulate-aarch64
      home-manager
      i18n
      nix
      nix-ld
      preservation
      remote-builds
      scx
      stylix
      systemd-boot
      tmpfs
      xanmod-kernel
      zram
      zfs

      niri
      noctalia-shell
      # gnome
      # gnome-monitors-desktop

      cli
      discord
      gaming
      ghostty
      multimedia
      obsidian
      telegram-desktop
      zed-editor
      zen-browser

      auto-cpufreq
      easyeffects
      fail2ban
      kerberos
      pipewire
      sshd
      syncthing

      ludd-wireguard-client
      server-wireguard-client
    ];
  };
}
