{
  pkgs,
  vars,
  ...
}: let
  enable = true;
  image = pkgs.fetchurl {
    url = "https://w.wallhaven.cc/full/k8/wallhaven-k898gq.jpg";
    sha256 = "sha256-BjREdU8AqHatcnVdpGE09kPrQTTt1mIagiHfLRSxPVw=";
  };
  polarity = "dark";
  base16Scheme = "${pkgs.base16-schemes}/share/themes/catppuccin-frappe.yaml";
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
  icons.package = pkgs.papirus-icon-theme;
  icons.dark = "Papirus-Dark";
  icons.enable = true;
in {
  stylix = {
    inherit enable image polarity base16Scheme cursor fonts icons;
  };

  home-manager.users.${vars.username}.stylix.targets = {
    qt.platform = "qtct";
    zen-browser.profileNames = ["${vars.username}"];
  };
}
