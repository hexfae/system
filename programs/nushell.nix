{...}: {
  home-manager.users.hexfae.programs.nushell.enable = true;
  home-manager.users.hexfae.programs.nushell.configFile.text = "$env.config = { show_banner: false }";
  home-manager.users.hexfae.programs.nushell.shellAliases.edit = "hx ~/nix";
  home-manager.users.hexfae.programs.nushell.shellAliases.switch = "nh os switch ~/nix";
  home-manager.users.hexfae.programs.nushell.shellAliases.boot = "nh os boot ~/nix";
  home-manager.users.hexfae.programs.nushell.shellAliases.test = "nh os test ~/nix";
  home-manager.users.hexfae.programs.nushell.shellAliases.build = "nh os build ~/nix";
}
