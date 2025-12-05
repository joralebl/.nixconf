{
  lib,
  pkgs,
  ...
}: {
  programs.niri.settings = {
    xwayland-satellite = {
      enable = true;
      path = lib.getExe pkgs.xwayland-satellite-unstable;
    };
    spawn-at-startup = [
      {command = ["noctalia-shell"];}
    ];
    input = {
      mouse = {
        accel-profile = "flat";
        accel-speed = 0;
      };
    };

    layout = {
      gaps = 16;
      center-focused-column = "never";

      tab-indicator = {
        hide-when-single-tab = true;
        place-within-column = true;
        position = "top";
        gaps-between-tabs = 8;
        gap = 8;
      };
    };

    prefer-no-csd = true;
    outputs = {
      HDMI-A-1 = {
        enable = true;
        mode = {
          width = 1920;
          height = 1080;
          refresh = 60.000;
        };
        position = {
          x = -1920;
          y = 0;
        };
      };

      DP-1 = {
        enable = true;
        focus-at-startup = true;
        mode = {
          width = 2560;
          height = 1440;
          refresh = 164.835;
        };
        position = {
          x = 0;
          y = 0;
        };
      };

      DP-2 = {
        enable = true;
        mode = {
          width = 1920;
          height = 1080;
          refresh = 60.000;
        };
        position = {
          x = 2560;
          y = 0;
        };
        transform.rotation = 90;
      };
    };

    hotkey-overlay.skip-at-startup = true;

    environment = {
      MOZ_ENABLE_WAYLAND = "1";
      QT_QPA_PLATFORM = "wayland";
      ELECTRON_OZONE_PLATFORM_HINT = "wayland";
      QT_QPA_PLATFORMTHEME = "gtk3";
      QT_QPA_PLATFORMTHEME_QT6 = "gtk3";
      TERMINAL = "kitty";
      EDITOR = "nvim";
    };
  };
}
