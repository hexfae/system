{...}: {
  home-manager.users.hexfae.programs.nushell = {
    enable = true;
    configFile.text = "$env.config = { show_banner: false }";
    shellAliases = {
      edit = "hx ~/nix";
      switch = "nh os switch ~/nix";
      boot = "nh os boot ~/nix";
      test = "nh os test ~/nix";
      build = "nh os build ~/nix";
    };
  };
}
