{pkgs, ...}: let
  image = pkgs.fetchurl {
    url = "https://images.unsplash.com/photo-1480796927426-f609979314bd";
    sha256 = "sha256-S0MumuBGJulUekoGI2oZfUa/50Jw0ZzkqDDu1nRkFUA=";
  };
  base16Scheme = "${pkgs.base16-schemes}/share/themes/onedark.yaml";
  polarity = "dark";
  cursor.package = pkgs.posy-cursors;
  cursor.name = "Posy_Cursor_Black";
  cursor.size = 32;
  sansSerif.package = pkgs.atkinson-hyperlegible-next;
  sansSerif.name = "Atkinson Hyperlegible Next";
  serif.package = pkgs.atkinson-hyperlegible-next;
  serif.name = "Atkinson Hyperlegible Next";
  monospace.package = pkgs.maple-mono.NF-CN;
  monospace.name = "Maple Mono NF CN";
  emoji.package = pkgs.twitter-color-emoji;
  emoji.name = "Twitter Color Emoji";
  fonts.sansSerif = sansSerif;
  fonts.serif = serif;
  fonts.monospace = monospace;
  fonts.emoji = emoji;
  fonts.sizes.terminal = 16;
  iconTheme.package = pkgs.papirus-icon-theme;
  iconTheme.dark = "Papirus-Dark";
  iconTheme.enable = true;
in {
  stylix = {
    enable = true;
    inherit image;
    inherit polarity;
    inherit base16Scheme;
    inherit cursor;
    inherit fonts;
    targets.plymouth.enable = false;
  };

  home-manager.users.hexfae = {
    stylix = {
      enable = true;
      inherit image;
      inherit polarity;
      inherit base16Scheme;
      inherit cursor;
      inherit fonts;
      inherit iconTheme;
      targets.firefox.profileNames = ["hexfae"];
      targets.qt.platform = "qtct";
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
}
