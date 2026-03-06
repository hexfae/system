{
  flake.modules.nixos.bottles = {config, ...}: {
    preservation.preserveAt."/preserve".users.${config.constants.username}.directories = [".local/share/bottles"];
  };
}
