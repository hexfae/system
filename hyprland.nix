{...}: {
  programs.hyprland.enable = true;
  programs.hyprland.withUWSM = true;
  networking.networkmanager.enable = true;
  home-manager.users.hexfae.wayland.windowManager.hyprland = {
    systemd.enable = false; # conflicts with uwsm
    enable = true;
    settings = {
      "$mod" = "SUPER";

      input = {
        "kb_layout" = "se";
        "accel_profile" = "flat";
      };

      bind = [
        "$mod, Return, exec, ghostty"
        "$mod, W, exec, zen"
        "$mod, D, exec, vesktop"
        "$mod, E, exec, nautilus"

        "$mod, F, fullscreen"
        "$mod, Q, killactive"
        "$mod, M, exit"
        "$mod, Space, togglefloating"

        "$mod, h, movefocus, l"
        "$mod, j, movefocus, d"
        "$mod, k, movefocus, u"
        "$mod, l, movefocus, r"

        "$mod + SHIFT, h, movewindow, l"
        "$mod + SHIFT, j, movewindow, d"
        "$mod + SHIFT, k, movewindow, u"
        "$mod + SHIFT, l, movewindow, r"

        "$mod, mouse_down, workspace, e-1"
        "$mod, mouse_up, workspace, e+1"

        "$mod, 1, workspace, 1"
        "$mod, 2, workspace, 2"
        "$mod, 3, workspace, 3"
        "$mod, 4, workspace, 4"
        "$mod, 5, workspace, 5"
        "$mod, 6, workspace, 6"
        "$mod, 7, workspace, 7"
        "$mod, 8, workspace, 8"
        "$mod, 9, workspace, 9"
        "$mod, 0, workspace, 10"

        "$mod + SHIFT, 1, movetoworkspace, 1"
        "$mod + SHIFT, 2, movetoworkspace, 2"
        "$mod + SHIFT, 3, movetoworkspace, 3"
        "$mod + SHIFT, 4, movetoworkspace, 4"
        "$mod + SHIFT, 5, movetoworkspace, 5"
        "$mod + SHIFT, 6, movetoworkspace, 6"
        "$mod + SHIFT, 7, movetoworkspace, 7"
        "$mod + SHIFT, 8, movetoworkspace, 8"
        "$mod + SHIFT, 9, movetoworkspace, 9"
        "$mod + SHIFT, 0, movetoworkspace, 10"

        "CTRL + ALT, A, exec, playerctl position -5"
        "CTRL + ALT, D, exec, playerctl position +5"
      ];

      binde = [
        "CTRL + ALT, W, exec, wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"
        "CTRL + ALT, S, exec, wpctl set-volume -l 0 @DEFAULT_AUDIO_SINK@ 5%-"
      ];

      bindo = [
        "CTRL + ALT, A, exec, playerctl previous"
        "CTRL + ALT, D, exec, playerctl next"
      ];

      bindm = [
        "$mod, mouse:272, movewindow"
        "$mod, mouse:273, resizewindow"
      ];

      monitor = [
        "DP-2, 1920x1080@144, 0x0, 1"
        "HDMI-A-2, 1920x1080@75, 1920x240, 1"
      ];
    };
  };
}
