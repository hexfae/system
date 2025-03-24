{pkgs, ...}: {
  home-manager.users.hexfae.home.packages = with pkgs; [
    imagemagick
    bacon
    yt-dlp
    ffmpeg
    tlrc
    nil
    alejandra
  ];
}
