{
  pkgs,
  inputs,
  ...
}: {
  home-manager.users.hexfae.programs.wezterm.enable = true;
  home-manager.users.hexfae.programs.wezterm.package = inputs.wezterm.packages.${pkgs.system}.default;
  home-manager.users.hexfae.programs.wezterm.extraConfig = ''
    return {
      use_fancy_tab_bar = false,
      hide_tab_bar_if_only_one_tab = true,
      default_prog = { '${pkgs.nushell}/bin/nu', '-l' },
    }
  '';
}
