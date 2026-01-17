{vars, ...}: {
  home-manager.users.${vars.username}.home.stateVersion = "25.05";
  system.stateVersion = "25.05";

  huncs = {
    desktops.gnome.enable = true;
    services = {
      pipewire.enable = true;
      kerberos.enable = true;
    };
    networking.wireguard.client = {
      ludd.enable = true;
      server.enable = true;
    };
    programs = {
      zen-browser.enable = true;
      discord.enable = true;
      ghostty.enable = true;
      zed-editor.enable = true;
      telegram-desktop.enable = true;
      distrobox.enable = true;
    };
  };
}
