{...}: {
  home-manager.users.hexfae.programs.starship.enable = true;
  home-manager.users.hexfae.programs.starship.settings.character.success_symbol = "[❯](green)";
  home-manager.users.hexfae.programs.starship.settings.character.error_symbol = "[❯](green)";
  home-manager.users.hexfae.programs.starship.settings.cmd_duration.min_time = 1000;
  home-manager.users.hexfae.programs.starship.settings.cmd_duration.format = "in [$duration](bold yellow) ";
  home-manager.users.hexfae.programs.starship.settings.directory.read_only = " ";
  home-manager.users.hexfae.programs.starship.settings.directory.style = "bold white";
  home-manager.users.hexfae.programs.starship.settings.directory.read_only_style = "bold yellow";
  home-manager.users.hexfae.programs.starship.settings.directory.truncation_length = 8;
  home-manager.users.hexfae.programs.starship.settings.directory.truncation_symbol = "…/";
  home-manager.users.hexfae.programs.starship.settings.username.format = "[\\[](bold red)[$user](bold yellow)";
  home-manager.users.hexfae.programs.starship.settings.username.disabled = false;
  home-manager.users.hexfae.programs.starship.settings.username.show_always = true;
  home-manager.users.hexfae.programs.starship.settings.hostname.ssh_only = false;
  home-manager.users.hexfae.programs.starship.settings.hostname.format = "[@](bold green)[$hostname](bold blue)[\\]](bold purple) ";
  home-manager.users.hexfae.programs.starship.settings.hostname.trim_at = ".companyname.com";
  home-manager.users.hexfae.programs.starship.settings.hostname.disabled = false;
}
