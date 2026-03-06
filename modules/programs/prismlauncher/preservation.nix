{
  flake.modules.nixos.prismlauncher = {config, ...}: {
    preservation.preserveAt."/preserve".users.${config.constants.username}.directories = [".local/share/PrismLauncher"];
  };
}
