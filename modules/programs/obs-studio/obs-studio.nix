{
  flake.modules.nixos.obs-studio = {config, ...}: {
    programs.obs-studio = {
      enable = true;
      enableVirtualCamera = true;
    };
  };
}
