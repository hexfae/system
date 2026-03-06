{
  flake.modules.nixos.zen-browser = {config, ...}: {
    preservation.preserveAt."/preserve".users.${config.constants.username}.directories = [".config/zen"];
  };
}
