{...}: {
  home-manager.users.hexfae.programs.git = {
    enable = true;
    userName = "hexfae";
    userEmail = "hexfae@proton.me";
  };
  age.secrets.github = {
    file = ../secrets/github.age;
    owner = "hexfae";
    # change path because git needs the folder where the credentials are stored to be writable to create a lock file (TODO: FIXME: i'm not sure this actually fixes it)
    path = "/home/hexfae/.config/git/credentials";
    name = "credentials";
  };
  # home-manager.users.hexfae.programs.git.extraConfig.credential.helper = "store --file ${config.age.secrets.github.path}";
  home-manager.users.hexfae.programs.git.extraConfig.credential.helper = "store";
}
