{inputs, ...}: {
  flake.modules = {
    nixos.user = {config, ...}: let
      user = config.constants.username;
      stateHome = "${config.constants.home}/.local/state";
      dataHome = "${config.constants.home}/.local/share";
    in {
      home-manager.sharedModules = [inputs.self.modules.homeManager.user];
      environment.variables = {
        HISTFILE = "${stateHome}/bash/history";
        CARGO_HOME = "${dataHome}/cargo";
        QT_QPA_PLATFORM = "wayland";
        NIXOS_OZONE_WL = "1";
        ELECTRON_OZONE_PLATFORM_HINT = "wayland";
        MOZ_ENABLE_WAYLAND = "1";
      };
      services.userborn.enable = true;
      users = {
        mutableUsers = false;
        users."${user}" = {
          isNormalUser = true;
          hashedPasswordFile = inputs.self + /secrets/authentication/user-password.txt;
          extraGroups = ["networkmanager" "wheel" "dialout"];
        };
      };
    };
    homeManager.user = {config, ...}: let
      stateHome = "${config.constants.home}/.local/state";
      configHome = "${config.constants.home}/.config";
    in {
      programs.bash = {
        historyFile = "${stateHome}/bash/history";
        enable = true; # needed for above to work
      };
      gtk.gtk2.configLocation = "${configHome}/gtk-2.0/gtkrc";
      xresources.path = "${configHome}/X11/resources";
    };
  };
}
