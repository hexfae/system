{
  lib,
  pkgs,
  ...
}: {
  imports = [
    ../../boot.nix
    ../../home.nix
    ../../i18n.nix
    ../../nix.nix
    ../../stylix.nix
    ../../system.nix
    ../../user.nix
    ../../programs/git.nix
    ../../programs/helix.nix
    ../../programs/zellij.nix
    ../../programs/zoxide.nix
    ../../programs/nushell.nix
    ../../programs/starship.nix
  ];

  networking.hostName = "server";
  systemd.targets.multi-user.enable = true; # TODO: remove?
  networking.networkmanager.enable = true;

  users.users.hexfae.openssh.authorizedKeys.keys = ["ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQC4mZc9C4U9ZyBsURgt/UbBLY5V84yj+zaQw6t641/5DT1/H7YwV9BEG6RuqGQ9EDTnV2n1AP51ST93x3MCN2Ypx9+DUFnDY/8Ptx7J2zoWnTRsThcsQ8E1xKDTbonHkgtJVhCDnzVT9L5eKRYQhuotPbzAk/u3xbwCXlsYyHEcLBO/HZupc34q2NFYfyeV2AB6WaT4/heh+glvZtUXkTkrqDxwqRgQ3JZ1vhoWK/07Uqh+qzW8TkaVtk8I8w++17RM+5DCbwjrXyKrtPnwo3nRJe0reIwVA5XB7dZI6dfdVctzCgzXPMDJ1UWAHlx2wfiiw15QT+34uDpLZ5Sspd65DOB0LVZ1WLe/qCm8XH7bLo0Rcs9Ml9WGDlwvf8UdHnNlXBNhRphbGZV1U2TUXKXz/EvzWdQBpzIVy4NT7I++IWtWwfu7iJHW8sDB8rukkxMPRLyL/hkcZwbuHfxlF6qz/6YoyL1dejZHeSo2ANP+qJiMRbBBhn3guU4KXOIW33k= hexfae@desktop"];

  hardware.graphics.enable32Bit = lib.mkForce false;
  services.flatpak.enable = lib.mkForce false;
  boot.kernelPackages = lib.mkForce pkgs.linuxPackages_latest;
  boot.extraModulePackages = lib.mkForce [];
  boot.kernelModules = lib.mkForce [];
  hardware.cpu.amd.updateMicrocode = lib.mkForce false;
  home-manager.users.hexfae.xdg.userDirs.createDirectories = lib.mkForce false;

  environment.systemPackages = with pkgs; [
    helix
    curl
    wget
  ];

  services.openssh.enable = true;
  services.openssh.settings.PermitRootLogin = "no";
  services.openssh.settings.PasswordAuthentication = false;

  services.getty.autologinUser = null;

  networking.firewall.allowedTCPPorts = [22];
  # networking.firewall.allowedUDPPorts = [ ... ];

  documentation.enable = false;

  system.stateVersion = "24.11";
}
