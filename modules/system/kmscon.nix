{
  flake.modules.nixos.kmscon = {
    pkgs,
    config,
    ...
  }: {
    services.kmscon = {
      enable = true;
      hwRender = true;
      extraConfig = "font-size=${toString config.stylix.fonts.sizes.terminal}";
      fonts = [
        {
          name = config.stylix.fonts.monospace.name;
          package = config.stylix.fonts.monospace.package;
        }
      ];
    };
  };
}
