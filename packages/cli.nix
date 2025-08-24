{
  pkgs,
  inputs,
  ...
}: {
  home-manager.users.hexfae.home.packages = with pkgs; [
    inputs.agenix.packages.${pkgs.system}.default
    uutils-coreutils-noprefix
    ffmpegthumbnailer
    imagemagick
    bacon
    yt-dlp
    ffmpeg
    tlrc
    nil
    alejandra
    fastfetch
  ];
}
