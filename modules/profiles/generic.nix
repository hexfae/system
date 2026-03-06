{inputs, ...}: {
  flake.modules.nixos.profiles-generic.imports = with inputs.self.modules.nixos; [
    agenix
    cli
    constants
    disko
    fail2ban
    home-manager
    i18n
    nix
    nix-ld
    preservation
    scx
    sshd
    syncthing
    stylix
    systemd-boot
    tmpfs
    user
    xanmod-kernel
    zram
  ];
}
