{config, ...}: {
  home-manager.users.hexfae.programs.git.enable = true;
  home-manager.users.hexfae.programs.git.userName = "hexfae";
  home-manager.users.hexfae.programs.git.userEmail = "hexfae@proton.me";
  age.secrets.github.file = ../secrets/github.age;
  age.secrets.github.owner = "hexfae";
  # change path because git needs the folder where the credentials are stored to be writable to create a lock file
  age.secrets.github.path = "/home/hexfae/.config/git/credentials";
  age.secrets.github.name = "credentials";
  home-manager.users.hexfae.programs.git.extraConfig.credential.helper = "store --file ${config.age.secrets.github.path}";
}
