{
  flake.modules.nixos.scx.services.scx = {
    enable = true;
    scheduler = "scx_lavd";
  };
}
