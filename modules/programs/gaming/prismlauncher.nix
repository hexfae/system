{
  flake.modules.homeManager.prismlauncher = {pkgs, ...}: {
    home.packages = with pkgs; [
      (prismlauncher.override {
        jdks = [
          jdk25
          jdk21
          jdk17
          jdk8
        ];
      })
    ];
  };
}
