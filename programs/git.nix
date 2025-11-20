{...}: {
  home-manager.users.hexfae.programs.git = {
    enable = true;
    settings = {
      user = {
        name = "hexfae";
        email = "hexfae@proton.me";
        init.defaultBranch = "main";
      };
    };
  };
}
