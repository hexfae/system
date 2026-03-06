{
  flake.modules.nixos.nushell = {config, ...}: {
    preservation.preserveAt."/preserve".users.${config.constants.username}.files = [".config/nushell/history.txt"];
  };
}
