{
  lib,
  config,
  ...
}: {
  config = lib.mkIf config.huncs.programs.git.enable {
    home-manager.users.hexfae.programs.git = {
      enable = true;
      userName = "hexfae";
      userEmail = "hexfae@proton.me";
      extraConfig.credential.helper = "store";
    };
  };
}
