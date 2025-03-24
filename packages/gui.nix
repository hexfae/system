{pkgs, ...}: {
  nixpkgs.overlays = [
    (final: prev: {
      windsurf = prev.windsurf.overrideAttrs (oldAttrs: {
        version = "1.5.6";
        src = prev.fetchurl {
          url = "https://windsurf-stable.codeiumdata.com/linux-x64/stable/164066c0badcfdea724847b1a24fd88eb96f9510/Windsurf-linux-x64-1.5.6.tar.gz";
          sha256 = "5b01ce09139d7d8932be5c297a1c71a891a299825b2d5304f3fed22367188ecb";
        };
      });
    })
  ];
  home-manager.users.hexfae.home.sessionVariables.GDK_BACKEND = "wayland,x11,*";
  home-manager.users.hexfae.home.sessionVariables.QT_QPA_PLATFORM = "wayland;xcb";
  home-manager.users.hexfae.home.sessionVariables.SDL_VIDEODRIVER = "wayland";
  home-manager.users.hexfae.home.sessionVariables.CLUTTER_BACKEND = "wayland";
  home-manager.users.hexfae.home.sessionVariables.MOZ_USE_XINPUT2 = "1";
  home-manager.users.hexfae.home.packages = with pkgs; [
    jetbrains.idea-community-bin
    kdePackages.kdenlive
    windsurf
    imagemagick
    vesktop
    bacon
    gimp
    yt-dlp
    ffmpeg
    tlrc
    nil
    alejandra
    amberol
    obsidian
    celluloid
  ];
}
