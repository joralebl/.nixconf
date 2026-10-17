{
  config,
  lib,
  pkgs,
  ...
}:
let
  corner-radius = 6.0;
  hl_color = "${config.lib.stylix.colors.base08}";
in
{
  programs.niri.settings = {
    xwayland-satellite = {
      enable = true;
      path = lib.getExe pkgs.xwayland-satellite-unstable;
    };
    debug = {
      honor-xdg-activation-with-invalid-serial = [ ];
    };
    spawn-at-startup = [
      { command = [ "noctalia" ]; }
      {
        command = [
          "dispwin"
          "-d"
          "DP-1"
          "/home/jordanl/rtings-icc-profile.icm"
        ];
      }
    ];
    input = {
      mouse = {
        accel-profile = "flat";
        accel-speed = 0;
      };
      keyboard = {
        repeat-delay = 300;
        repeat-rate = 50;
      };
      tablet = {
        map-to-output = "DP-1";
      };
    };

    layout = {
      gaps = 12;
      struts = {
        bottom = 0;
        top = 0;
      };
      center-focused-column = "never";
      always-center-single-column = true;

      focus-ring = {
        enable = true;
        width = 2;
        active.color = hl_color;
      };
      border = {
        enable = false;
        width = 2;
        active.color = hl_color;
      };

      tab-indicator = {
        hide-when-single-tab = true;
        place-within-column = true;
        position = "top";
        gaps-between-tabs = 8;
        gap = 8;
      };
      insert-hint = {
        enable = true;
        display.color = "rgba(255,221,51,0.4)";

      };
    };

    prefer-no-csd = true;
    window-rules = [
      {
        matches = [ {app-id = "dev.noctalia.Noctalia";} ];
        open-floating = true;
        default-column-width.fixed = 1080;
        default-window-height.fixed = 920;
      }
      {
        matches = [ ];
        geometry-corner-radius = {
          bottom-left = corner-radius;
          bottom-right = corner-radius;
          top-left = corner-radius;
          top-right = corner-radius;
        };
        clip-to-geometry = true;
        draw-border-with-background = false;
      }
      {
        matches = [ { is-floating = true; } ];
        shadow.enable = true;
      }
      # {
      #   matches = [{is-focused = true;}];
      #   shadow = {
      #     enable = true;
      #     color = config.lib.stylix.colors.base0D;
      #     softness = 30;
      #     spread = -10;
      #     draw-behind-window = true;
      #   };
      # }
      {
        matches = [
          { app-id = "firefox$"; }
          { title = "^Picture-in-Picture$"; }
        ];
        open-on-output = "HDMI-A-1";
      }
      {
        matches = [ { app-id = "mpv$"; } ];
        open-on-output = "HDMI-A-1";
      }

      {
        matches = [ { app-id = "vesktop$"; } ];
        open-on-output = "DP-2";
      }
    ];

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
        variable-refresh-rate = "on-demand";
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
      NIXOS_OZONE_WL = "1";
      MOZ_ENABLE_WAYLAND = "1";
      GDK_BACKEND = "wayland";
      QT_QPA_PLATFORM = "wayland";
      ELECTRON_OZONE_PLATFORM_HINT = "wayland";
      QT_QPA_PLATFORMTHEME = "gtk3";
      QT_QPA_PLATFORMTHEME_QT6 = "gtk3";
      TERMINAL = "kitty";
      EDITOR = "nvim";
      LISTENBRAINZ_USER_TOKEN = "d52b8907-0265-4c77-afe5-47aa59be4b82";
      KILO_API_KEY = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbnYiOiJwcm9kdWN0aW9uIiwia2lsb1VzZXJJZCI6IjA0NDZmZTY5LTkxMTEtNDk3YS04OWM0LTYzNTI4ZjRjYzQ2ZSIsImFwaVRva2VuUGVwcGVyIjpudWxsLCJ2ZXJzaW9uIjozLCJpYXQiOjE3ODU0NzMxNzUsImV4cCI6MTk0MzE1MzE3NX0.io4sdsWPtWfZhwLfSFhjg81i4xjzhwvAxD9wzPvXf9s";

    };
  };
}
