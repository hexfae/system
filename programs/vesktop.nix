{inputs, ...}: {
  home-manager = {
    sharedModules = [inputs.nixcord.homeManagerModules.nixcord];
    users.hexfae.programs.nixcord = {
      enable = true;
      discord.enable = false;
      vesktop.enable = true;
    };
  };
}
