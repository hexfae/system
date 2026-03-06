{
  flake.modules.nixos.steam = {config, ...}: {
    preservation.preserveAt."/preserve".users.${config.constants.username}.directories = [".steam" ".local/share/Steam"];
  };
}
