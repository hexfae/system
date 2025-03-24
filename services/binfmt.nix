{pkgs, ...}: {
  programs.java.binfmt = true;
  programs.appimage.binfmt = true;
  boot.binfmt.preferStaticEmulators = true;
  boot.binfmt.emulatedSystems =
    [
      "wasm32-wasi"
    ]
    ++ (
      if pkgs.stdenv.hostPlatform.system == "x86_64-linux"
      then ["aarch64-linux" "i686-linux" "i686-windows" "x86_64-windows"]
      else if pkgs.stdenv.hostPlatform.system == "aarch64-linux"
      then ["x86_64-linux"]
      else []
    );
}
