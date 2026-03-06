{
  flake.modules.nixos.ssh = {config, ...}: {
    preservation.preserveAt."/preserve".users.${config.constants.username}.directories = [
      {
        directory = ".ssh";
        mode = "0700";
      }
    ];
  };
}
