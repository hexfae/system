{
  flake.modules.nixos.ollama = {
    preservation.preserveAt."/preserve".directories = ["/var/lib/private/ollama"];
  };
}
