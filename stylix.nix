{pkgs, ...}: let
  wallpaper = pkgs.fetchurl {
    url = "https://images.unsplash.com/photo-1480796927426-f609979314bd";
    sha256 = "sha256-S0MumuBGJulUekoGI2oZfUa/50Jw0ZzkqDDu1nRkFUA=";
  };
  theme = "${pkgs.base16-schemes}/share/themes/onedark.yaml";
  polarity = "dark";
  cursor.package = pkgs.posy-cursors;
  cursor.name = "Posy_Cursor_Black";
  cursor.size = 36;
  sansSerif.package = pkgs.roboto-flex;
  sansSerif.name = "Roboto Flex";
  serif.package = pkgs.roboto-slab;
  serif.name = "Roboto Slab";
  monospace.package = pkgs.maple-mono-NF;
  monospace.name = "Maple Mono NF";
  emoji.package = pkgs.twitter-color-emoji;
  emoji.name = "Twitter Color Emoji";
  fonts.sansSerif = sansSerif;
  fonts.serif = serif;
  fonts.monospace = monospace;
  fonts.emoji = emoji;
  fonts.sizes.terminal = 16;
  icons.package = pkgs.papirus-icon-theme;
  icons.dark = "Papirus-Dark";
  icons.enable = true;
in {
  stylix.enable = true;
  stylix.image = wallpaper;
  stylix.polarity = polarity;
  stylix.base16Scheme = theme;
  stylix.cursor = cursor;
  stylix.fonts = fonts;
  stylix.targets.plymouth.enable = false;

  home-manager.users.hexfae.stylix = {
    enable = true;
    image = wallpaper;
    polarity = polarity;
    base16Scheme = theme;
    cursor = cursor;
    fonts = fonts;
    iconTheme = icons;
    targets.firefox.profileNames = ["hexfae"];
    targets.qt.platform = "qtct";
  };
}
