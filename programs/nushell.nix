{...}: {
  home-manager.users.hexfae.programs.nushell.enable = true;
  home-manager.users.hexfae.programs.nushell.configFile.text = "$env.config = { show_banner: false }";
  home-manager.users.hexfae.programs.nushell.shellAliases.edit = "hx ~/nix";
  home-manager.users.hexfae.programs.nushell.shellAliases.switch = "sudo nixos-rebuild switch";
}
