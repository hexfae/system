{pkgs, ...}: {
  home-manager.users.hexfae.home.stateVersion = "25.05";
  system.stateVersion = "25.05";

  boot.kernelPackages = pkgs.linuxPackages_cachyos;
  huncs = {
    desktops.gnome.enable = true;
    services.pipewire.enable = true;
    programs = {
      vesktop.enable = true;
      ghostty.enable = true;
      zed-editor.enable = true;
      telegram-desktop.enable = true;
    };
  };
}
