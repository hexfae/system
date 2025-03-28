# a NixOS configuration

## machines

- desktop: custom desktop pc
- server: oracle cloud arm vps
- laptop: dell precision 3540
- deck: steam deck

## noteworthy

- [hardware/b650-fix-suspend.nix](https://github.com/hexfae/system/blob/main/hardware/b650-fix-suspend.nix)
  includes a fix for a sleep bug in my desktop's motherboard (asus tuf gaming b650-e wifi) where it
  immediately wakes up when going to sleep
- [programs/firefox.nix](https://github.com/hexfae/system/blob/main/programs/firefox.nix) is a pretty detailed
  firefox home manager configuration, that sets profile-sync-daemon, gnome browser connector, a few extensions (and
  in the future should also configure them), configures search engines like !np (nix packages on nixos.org) or !lib
  (rust libraries on [lib.rs](https://lib.rs)), sets a bunch of `about:config` preferences, and 2 toolbar bookmarks
- [programs/helix.nix](https://github.com/hexfae/system/blob/main/programs/helix.nix) configures helix to be a pretty
  decent rust/nix ide
- [programs/nushell.nix](https://github.com/hexfae/system/blob/main/programs/nushell.nix) configures some nix-related
  aliases like `edit`, `switch`, `boot`, `test`, and `build`
- [programs/starship.nix](https://github.com/hexfae/system/blob/main/programs/starship.nix) configures a quite pretty prompt
- [secrets/secrets.nix](https://github.com/hexfae/system/blob/main/secrets/secrets.nix) configures some secrets for e.g.
  github and transmission and uses [ragenix](https://github.com/yaxitech/ragenix) (a drop-in replacement for
  [agenix](https://github.com/ryantm/agenix)) with ssh public keys for all of my machines
  
