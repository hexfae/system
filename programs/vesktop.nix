{inputs, ...}: {
  home-manager.sharedModules = [inputs.nixcord.homeManagerModules.nixcord];
  home-manager.users.hexfae.programs.nixcord.enable = true;
  home-manager.users.hexfae.programs.nixcord.discord.enable = false;
  home-manager.users.hexfae.programs.nixcord.vesktop.enable = true;
}
