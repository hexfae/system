{
  lib,
  config,
  ...
}: {
  config = lib.mkIf config.huncs.services.home-assistant.enable {
    services.home-assistant = {
      enable = true;
      extraComponents = [
        "analytics"
        "google_translate"
        "met"
        "radio_browser"
        "shopping_list"
        "isal"
        "smartthings"
      ];
      config = {
        default_config = {};
      };
    };
  };
}
