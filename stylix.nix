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
  stylix.homeManagerIntegration.followSystem = true;
  stylix.targets.plymouth.enable = false;

  home-manager.users.hexfae = {
    gtk.enable = true;
    gtk.iconTheme.package = pkgs.papirus-icon-theme;
    gtk.iconTheme.name = "Papirus-Dark";
    stylix = {
      polarity = "dark";
      enable = true;
      image = wallpaper;
      base16Scheme = theme;
      cursor = cursor;
      targets = {
        qt.platform = "qtct";
        firefox.profileNames = ["hexfae"];
      };
      fonts = {
        sansSerif = sansSerif;
        serif = serif;
        monospace = monospace;
        emoji = emoji;
        sizes.terminal = 16;
      };
    };
  };
}
