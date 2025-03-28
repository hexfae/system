# a NixOS configuration

## machines

- [desktop](https://github.com/hexfae/system/blob/main/machines/desktop/configuration.nix): custom desktop pc
- [server](https://github.com/hexfae/system/blob/main/machines/server/configuration.nix): oracle cloud arm vps
- [laptop](https://github.com/hexfae/system/blob/main/machines/laptop/configuration.nix): dell precision 3540
- [deck](https://github.com/hexfae/system/blob/main/machines/deck/configuration.nix): steam deck

## noteworthy

- [hardware/b650-fix-suspend.nix](https://github.com/hexfae/system/blob/main/hardware/b650-fix-suspend.nix)
  includes a fix for a sleep bug in my desktop's motherboard (asus tuf gaming b650-e wifi) where it
  immediately wakes up when going to sleep
- [programs/firefox.nix](https://github.com/hexfae/system/blob/main/programs/firefox.nix) is a pretty detailed
  firefox home manager configuration, that sets profile-sync-daemon, gnome browser connector, a few extensions
  (and in the future should also configure them), configures search engines like !np/!no/!ho (nix
  packages/options on [search.nixos.org](https://search.nixos.org/)/home manager options on
  [home-manager-options.extranix.com](https://home-manager-options.extranix.com/)) or !lib (rust libraries
  on [lib.rs](https://lib.rs)), sets a bunch of `about:config` preferences, and 2 toolbar bookmarks
- [programs/helix.nix](https://github.com/hexfae/system/blob/main/programs/helix.nix) configures helix to be a pretty
  decent rust/nix ide
- [programs/nushell.nix](https://github.com/hexfae/system/blob/main/programs/nushell.nix) configures some nix-related
  aliases like `edit`, `switch`, `boot`, `test`, and `build`
- [programs/starship.nix](https://github.com/hexfae/system/blob/main/programs/starship.nix) configures a quite pretty prompt
- [secrets/secrets.nix](https://github.com/hexfae/system/blob/main/secrets/secrets.nix) configures some secrets for e.g.
  github and transmission and uses [ragenix](https://github.com/yaxitech/ragenix) (a drop-in replacement for
  [agenix](https://github.com/ryantm/agenix)) with ssh public keys for all of my machines
  
