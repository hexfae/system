{
  flake.modules.nixos.discord = {config, ...}: {
    preservation.preserveAt."/preserve".users.${config.constants.username}.directories = [".config/equibop"];
  };
}
