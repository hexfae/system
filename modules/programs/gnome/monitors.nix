{inputs, ...}: {
  flake.modules.nixos.gnome-monitors-desktop.home-manager.sharedModules = [
    {
      xdg.configFile."monitors.xml" = {
        source = inputs.self + /files/monitors.xml;
        force = true;
      };
    }
  ];
}
