{
  flake.modules.nixos.telegram-desktop = {config, ...}: {
    preservation.preserveAt."/preserve".users.${config.constants.username}.directories = [".local/share/TelegramDesktop/tdata"];
  };
}
