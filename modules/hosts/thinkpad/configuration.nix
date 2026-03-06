{inputs, ...}: {
  flake.modules.nixos.thinkpad = {config, ...}: {
    networking.networkmanager.enable = true;
    networking.hostId = "611d21b4";
    system.stateVersion = "26.05";
    home-manager.users.${config.constants.username}.home.stateVersion = "26.05";
    imports = with inputs.self.modules.nixos; [
      profiles-generic
      # ananicy
      emulate-aarch64
      remote-builds

      niri
      noctalia-shell

      discord
      gaming
      ghostty
      multimedia
      obsidian
      telegram-desktop
      walker
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
