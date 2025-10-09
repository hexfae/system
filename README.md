# a NixOS configuration

## machines

- [desktop](https://github.com/hexfae/system/blob/main/hosts/desktop/configuration.nix): custom desktop pc
- [thinkpad](https://github.com/hexfae/system/blob/main/hosts/thinkpad/configuration.nix): thinkpad t480s
- [server](https://github.com/hexfae/system/blob/main/hosts/server/configuration.nix): oracle cloud arm vps
- [laptop](https://github.com/hexfae/system/blob/main/hosts/laptop/configuration.nix): dell precision 3540
- [deck](https://github.com/hexfae/system/blob/main/hosts/deck/configuration.nix): steam deck

## noteworthy

- [common/huncs.nix](https://github.com/hexfae/system/blob/main/common/huncs.nix) hexfae's ultimate nixos configuration system,
  just defines a bunch of configuration options so i can simply `.enable` them in every host's `configuration.nix`
- [modules/programs/zen.nix](https://github.com/hexfae/system/blob/main/modules/programs/zen.nix) is a detailed zen browser
  (firefox fork) home manager configuration, that sets profile-sync-daemon (Soon™), gnome browser connector, a few extensions
  (and in the future should also configure them), configures search engines like !np/!no/!ho (nix
  packages/options on [search.nixos.org](https://search.nixos.org/)/home manager options on
  [home-manager-options.extranix.com](https://home-manager-options.extranix.com/)) or !lib (rust libraries
  on [lib.rs](https://lib.rs)), sets a bunch of `about:config` preferences, and 2 toolbar bookmarks
- [modules/desktops/gnome.nix](https://github.com/hexfae/system/blob/main/modules/desktops/gnome.nix) is a detailed gnome configuration
  that tries to configure the whole desktop environment and all settings declaratively, including default applications, gnome settings,
  extensions and their settings, remove unused (for me) gnome core apps, etc.
- [common/stylix.nix](https://github.com/hexfae/system/blob/main/common/stylix.nix) configures stylix with a cursor theme, fonts, a color
  scheme, an icon theme, a wallpaper, etc., and hides the theme configuration program desktop files,
- [modules/programs/helix.nix](https://github.com/hexfae/system/blob/main/modules/programs/helix.nix) configures helix to be a pretty
  decent rust/nix ide
- [modules/programs/nushell.nix](https://github.com/hexfae/system/blob/main/modules/programs/nushell.nix) configures some nix-related
  aliases like `edit`, `switch`, `boot`, `test`, and `build` and disables the welcome banner
- [modules/programs/starship.nix](https://github.com/hexfae/system/blob/main/modules/programs/starship.nix) configures a quite pretty prompt
- [modules/secrets/secrets.nix](https://github.com/hexfae/system/blob/main/modules/secrets/secrets.nix) configures some secrets for e.g.
  github and transmission and uses [ragenix](https://github.com/yaxitech/ragenix) (a drop-in replacement for
  [agenix](https://github.com/ryantm/agenix)) with ssh public keys for all of my machines
  
