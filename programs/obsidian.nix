{
  lib,
  config,
  ...
}: {
  options.huncs.programs.obsidian.enable = lib.mkEnableOption "obsidian";

  config = lib.mkIf config.huncs.programs.obsidian.enable {
    home-manager.users.hexfae.programs.obsidian = {
      enable = true;
      vaults."md".target = "dox/md";
    };
  };
}
