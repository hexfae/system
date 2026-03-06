{
  flake.modules.nixos.obs-studio = {config, ...}: {
    preservation.preserveAt."/preserve".users.${config.constants.username}.directories = [".config/obs-studio"];
  };
}
