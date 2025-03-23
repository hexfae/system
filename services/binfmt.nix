{pkgs, ...}: {
  programs.java.binfmt = true;
  programs.appimage.binfmt = true;
  boot.binfmt.preferStaticEmulators = true;
  boot.binfmt.emulatedSystems =
    [
      "wasm32-wasi"
      "i686-windows"
      "x86_64-windows"
      "i686-linux"
    ]
    ++ (
      if pkgs.stdenv.hostPlatform.system == "x86_64-linux"
      then ["aarch64-linux"]
      else if pkgs.stdenv.hostPlatform.system == "aarch64-linux"
      then ["x86_64-linux"]
      else []
    );
}
