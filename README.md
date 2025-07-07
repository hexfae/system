# a NixOS configuration

## machines

- [desktop](https://github.com/hexfae/system/blob/main/machines/desktop/configuration.nix): custom desktop pc
- [thinkpad](https://github.com/hexfae/system/blob/main/machines/thinkpad/configuration.nix): thinkpad t480s
- [server](https://github.com/hexfae/system/blob/main/machines/server/configuration.nix): oracle cloud arm vps
- [laptop](https://github.com/hexfae/system/blob/main/machines/laptop/configuration.nix): dell precision 3540
- [deck](https://github.com/hexfae/system/blob/main/machines/deck/configuration.nix): steam deck

## noteworthy

- [programs/zen.nix](https://github.com/hexfae/system/blob/main/programs/zen.nix) is a detailed zen browser
  (firefox fork) home manager configuration, that sets profile-sync-daemon (Soon™), gnome browser connector, a few extensions
  (and in the future should also configure them), configures search engines like !np/!no/!ho (nix
  packages/options on [search.nixos.org](https://search.nixos.org/)/home manager options on
  [home-manager-options.extranix.com](https://home-manager-options.extranix.com/)) or !lib (rust libraries
  on [lib.rs](https://lib.rs)), sets a bunch of `about:config` preferences, and 2 toolbar bookmarks
- [gnome.nix](https://github.com/hexfae/system/blob/main/gnome.nix) is a detailed gnome configuration that tries to configure
  the whole desktop environment and all settings declaratively, including default applications, gnome settings, extensions and
  their settings, remove unused (for me) gnome core apps, etc.
- [stylix.nix](https://github.com/hexfae/system/blob/main/stylix.nix) configures stylix with a cursor theme, fonts, a color
  scheme, an icon theme, a wallpaper, etc., and hides the theme configuration program desktop files,
- [programs/helix.nix](https://github.com/hexfae/system/blob/main/programs/helix.nix) configures helix to be a pretty
  decent rust/nix ide
- [programs/nushell.nix](https://github.com/hexfae/system/blob/main/programs/nushell.nix) configures some nix-related
  aliases like `edit`, `switch`, `boot`, `test`, and `build` and disables the welcome banner
- [programs/starship.nix](https://github.com/hexfae/system/blob/main/programs/starship.nix) configures a quite pretty prompt
- [secrets/secrets.nix](https://github.com/hexfae/system/blob/main/secrets/secrets.nix) configures some secrets for e.g.
  github and transmission and uses [ragenix](https://github.com/yaxitech/ragenix) (a drop-in replacement for
  [agenix](https://github.com/ryantm/agenix)) with ssh public keys for all of my machines
  
