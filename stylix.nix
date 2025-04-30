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
  sansSerif.package = pkgs.roboto-flex;
  sansSerif.name = "Roboto Flex";
  serif.package = pkgs.roboto-slab;
  serif.name = "Roboto Slab";
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

  home-manager.users.hexfae.stylix = {
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
}
