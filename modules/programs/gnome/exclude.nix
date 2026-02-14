{
  flake.modules.nixos.gnome = {pkgs, ...}: {
    # https://wiki.nixos.org/wiki/GNOME#Excluding_GNOME_Applications
    environment.gnome.excludePackages = with pkgs; [
      orca # screen reader
      evince # document viewer
      file-roller # archive manager
      geary # mail client
      seahorse # keyring manager
      sushi # file previewer
      sysprof # system profiler
      adwaita-icon-theme
      baobab # disk analyzer
      epiphany # web browser
      simple-scan # document scanner
      snapshot # camera app
      totem # video player
      showtime # video player 2
      decibels # audio player
      yelp # help app
      papers # document viewer
      loupe # image viewer
      gnome-disk-utility
      gnome-shell-extensions
      gnome-backgrounds
      gnome-color-manager
      gnome-tour
      gnome-user-docs
      gnome-text-editor
      gnome-calculator
      gnome-calendar
      gnome-characters
      gnome-clocks
      gnome-console
      gnome-contacts
      gnome-font-viewer
      gnome-logs
      gnome-maps
      gnome-music
      gnome-system-monitor
      gnome-weather
      gnome-connections
      gnome-themes-extra
    ];
  };
}
