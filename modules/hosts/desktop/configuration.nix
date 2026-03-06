{inputs, ...}: {
  flake.modules.nixos.desktop = {config, ...}: {
    networking.hostId = "611d21b4";
    system.stateVersion = "25.11";
    home-manager.users.${config.constants.username}.home.stateVersion = "25.11";
    imports = with inputs.self.modules.nixos; [
      profiles-generic
      # ananicy
      emulate-aarch64
      remote-builds
      zfs

      niri
      noctalia-shell

      discord
      gaming
      ghostty
      multimedia
      obsidian
      telegram-desktop
      zed-editor
      zen-browser

      easyeffects
      kerberos
      pipewire

      ludd-wireguard-client
      server-wireguard-client
    ];
  };
}
