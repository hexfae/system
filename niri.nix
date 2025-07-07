{
  pkgs,
  inputs,
  ...
}: {
  networking.networkmanager.enable = true;
  nixpkgs.overlays = [inputs.niri.overlays.niri];
  programs.niri = {
    package = pkgs.niri-unstable;
    enable = true;
  };
  home-manager.users.hexfae.programs.niri.settings.binds = {
    "Mod+D".action.spawn = "ghostty";
    "Mod+W".action.spawn = "zen";
    "Mod+Shift+E".action.quit.skip-confirmation = true;
  };
}
