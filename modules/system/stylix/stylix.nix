{inputs, ...}: {
  flake.modules = {
    nixos.stylix = {
      pkgs,
      config,
      lib,
      ...
    }: let
      dataHome = "${config.constants.home}/.local/share";
      wallpaper = pkgs.fetchurl {
        url = "https://w.wallhaven.cc/full/1k/wallhaven-1kpqw9.jpg";
        sha256 = "sha256-C7w/kRuy5Ho+IeXkfECUYwsP+5pAkUdR9/zVEFsBrEU=";
      };
      phinger-cursors = {
        package = pkgs.phinger-cursors;
        name = "phinger-cursors-dark";
        size = 32;
      };
      atkinson-hyperlegible-next = {
        package = pkgs.atkinson-hyperlegible-next;
        name = "Atkinson Hyperlegible Next";
      };
      maple-mono = {
        package = pkgs.maple-mono.NF-CN;
        name = "Maple Mono NF CN";
      };
      twitter-color-emoji = {
        package = pkgs.twitter-color-emoji;
        name = "Twitter Color Emoji";
      };
      papirus-icon-theme = {
        package = pkgs.papirus-icon-theme;
        dark = "Papirus-Dark";
        enable = true;
      };
    in {
      imports = [inputs.stylix.nixosModules.stylix];
      home-manager.sharedModules = [inputs.self.modules.homeManager.stylix];
      environment.variables.XCURSOR_PATH = lib.mkForce "${dataHome}/icons";
      stylix = {
        enable = true;
        targets.plymouth.enable = false;
        image = wallpaper;
        polarity = "dark";
        base16Scheme = "${pkgs.base16-schemes}/share/themes/catppuccin-frappe.yaml";
        cursor = phinger-cursors;
        icons = papirus-icon-theme;
        fonts = {
          sansSerif = atkinson-hyperlegible-next;
          serif = atkinson-hyperlegible-next;
          monospace = maple-mono;
          emoji = twitter-color-emoji;
          sizes.terminal = 16;
        };
      };
    };
    homeManager.stylix = {config, ...}: {
      stylix.targets = {
        qt.platform = "qtct";
        zen-browser.profileNames = [config.constants.username];
      };
      xdg.desktopEntries = {
        "kvantummanager" = {
          name = "Kvantum Manager";
          exec = "kvantummanager";
          noDisplay = true;
        };
        "qt5ct" = {
          name = "Qt5 Settings";
          exec = "qt5ct";
          noDisplay = true;
        };
        "qt6ct" = {
          name = "Qt6 Settings";
          exec = "qt6ct";
          noDisplay = true;
        };
      };
    };
  };
}
