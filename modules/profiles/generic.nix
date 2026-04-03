{inputs, ...}: {
  flake.modules.nixos.profiles-generic.imports = with inputs.self.modules.nixos; [
    agenix
    cachyos-kernel
    cli
    constants
    disko
    fail2ban
    home-manager
    i18n
    nix
    nix-ld
    preservation
    sshd
    syncthing
    stylix
    systemd-boot
    tmpfs
    user
    zram
  ];
}
