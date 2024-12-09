{pkgs, ...}: let
  wallpaper = pkgs.fetchurl {
    url = "https://images.unsplash.com/photo-1480796927426-f609979314bd";
    sha256 = "sha256-S0MumuBGJulUekoGI2oZfUa/50Jw0ZzkqDDu1nRkFUA=";
  };
  theme = "${pkgs.base16-schemes}/share/themes/onedark.yaml";
in {
  stylix.enable = true;
  stylix.polarity = "dark";
  stylix.image = wallpaper;
  stylix.base16Scheme = theme;
  stylix.cursor.package = pkgs.posy-cursors;
  stylix.cursor.name = "Posy_Cursor_Black";
  stylix.fonts.sansSerif.package = pkgs.roboto;
  stylix.fonts.sansSerif.name = "Roboto";
  stylix.fonts.serif.package = pkgs.roboto-slab;
  stylix.fonts.serif.name = "Roboto Slab";
  stylix.fonts.monospace.package = pkgs.maple-mono-NF;
  stylix.fonts.monospace.name = "Maple Mono NF";
  stylix.fonts.emoji.package = pkgs.twitter-color-emoji;
  stylix.fonts.emoji.name = "Twitter Color Emoji";
  stylix.fonts.sizes.terminal = 16;

  # stylix.targets.grub.useImage = true;
  # stylix.targets.plymouth.enable = false;

  home-manager.users.hexfae.gtk.enable = true;
  home-manager.users.hexfae.stylix.polarity = "dark";
  home-manager.users.hexfae.gtk.iconTheme.package = pkgs.papirus-icon-theme;
  home-manager.users.hexfae.gtk.iconTheme.name = "Papirus-Dark";
  home-manager.users.hexfae.stylix.enable = true;
  home-manager.users.hexfae.stylix.image = wallpaper;
  home-manager.users.hexfae.stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/onedark.yaml";
  home-manager.users.hexfae.stylix.cursor.package = pkgs.posy-cursors;
  home-manager.users.hexfae.stylix.cursor.name = "Posy_Cursor_Black";
  home-manager.users.hexfae.stylix.fonts.serif.package = pkgs.roboto-slab;
  home-manager.users.hexfae.stylix.fonts.serif.name = "Roboto Slab";
  home-manager.users.hexfae.stylix.fonts.sansSerif.package = pkgs.roboto;
  home-manager.users.hexfae.stylix.fonts.sansSerif. name = "Roboto";
  home-manager.users.hexfae.stylix.fonts.monospace.package = pkgs.maple-mono-NF;
  home-manager.users.hexfae.stylix.fonts.monospace.name = "Maple Mono NF";
  home-manager.users.hexfae.stylix.fonts.emoji.package = pkgs.twitter-color-emoji;
  home-manager.users.hexfae.stylix.fonts.emoji.name = "Twitter Color Emoji";
  home-manager.users.hexfae.stylix.fonts.sizes.terminal = 16;
}
