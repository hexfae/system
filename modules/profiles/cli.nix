{inputs, ...}: {
  flake.modules.nixos.cli = {
    imports = with inputs.self.modules.nixos; [
      helix
      nix-index-database
      sudo-rs
    ];
    home-manager.sharedModules = with inputs.self.modules.homeManager; [
      bat
      fd
      ffmpeg
      git
      imagemagick
      jujutsu
      nh
      nushell
      pay-respects
      rclone
      ripgrep-all
      ssh
      starship
      tealdeer
      uutils
      yazi
      yt-dlp
      zellij
      zoxide
    ];
  };
}
