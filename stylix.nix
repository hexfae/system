{pkgs, ...}: let
  wallpaper = pkgs.fetchurl {
    url = "https://images.unsplash.com/photo-1480796927426-f609979314bd";
    sha256 = "sha256-S0MumuBGJulUekoGI2oZfUa/50Jw0ZzkqDDu1nRkFUA=";
  };
  theme = "${pkgs.base16-schemes}/share/themes/onedark.yaml";
  cursor.package = pkgs.posy-cursors;
  cursor.name = "Posy_Cursor_Black";
  sansSerif.package = pkgs.roboto-flex;
  sansSerif.name = "Roboto Flex";
  serif.package = pkgs.roboto-slab;
  serif.name = "Roboto Slab";
  monospace.package = pkgs.maple-mono-NF;
  monospace.name = "Maple Mono NF";
  emoji.package = pkgs.twitter-color-emoji;
  emoji.name = "Twitter Color Emoji";
in {
  stylix.enable = true;
  stylix.polarity = "dark";
  stylix.image = wallpaper;
  stylix.base16Scheme = theme;
  stylix.cursor = cursor;
  stylix.fonts.sansSerif = sansSerif;
  stylix.fonts.serif = serif;
  stylix.fonts.monospace = monospace;
  stylix.fonts.emoji = emoji;
  stylix.fonts.sizes.terminal = 16;

  home-manager.users.hexfae.gtk.enable = true;
  home-manager.users.hexfae.stylix.polarity = "dark";
  home-manager.users.hexfae.gtk.iconTheme.package = pkgs.papirus-icon-theme;
  home-manager.users.hexfae.gtk.iconTheme.name = "Papirus-Dark";
  home-manager.users.hexfae.stylix.enable = true;
  home-manager.users.hexfae.stylix.image = wallpaper;
  home-manager.users.hexfae.stylix.base16Scheme = theme;
  home-manager.users.hexfae.stylix.cursor = cursor;
  home-manager.users.hexfae.stylix.fonts.sansSerif = sansSerif;
  home-manager.users.hexfae.stylix.fonts.serif = serif;
  home-manager.users.hexfae.stylix.fonts.monospace = monospace;
  home-manager.users.hexfae.stylix.fonts.emoji = emoji;
  home-manager.users.hexfae.stylix.fonts.sizes.terminal = 16;
}
