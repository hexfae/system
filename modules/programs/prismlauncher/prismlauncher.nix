{inputs, ...}: {
  flake.modules = {
    nixos.prismlauncher.home-manager.sharedModules = [inputs.self.modules.homeManager.prismlauncher];
    homeManager.prismlauncher = {pkgs, ...}: {
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
  };
}
