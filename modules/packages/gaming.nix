{pkgs, ...}: {
  home-manager.users.hexfae.home.packages = with pkgs; [
    dolphin-emu
    prismlauncher
    azahar
    retroarch-full
  ];
}
