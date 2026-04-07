{
  flake.modules.nixos.ollama = {pkgs, ...}: {
    services.ollama = {
      enable = true;
      package = pkgs.ollama-rocm;
      syncModels = true;
      loadModels = [
        "huihui_ai/qwen3.5-abliterated:9b"
        "gemma4:e2b"
        "gemma4:e4b"
        "VladimirGav/gemma4-26b-16GB-VRAM"
      ];
    };
  };
}
