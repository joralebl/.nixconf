{lib, ...}: {
  programs.kitty = lib.mkForce {
    enable = true;

    shellIntegration.enableZshIntegration = true;

    actionAliases = {
      "launch_tab" = "launch --cwd=current --type=tab";
      "launch_window" = "launch --cwd=current --type=window";
    };

    keybindings = {
      "kitty_mod+enter" = "launch_window";
      "kitty_mod+t" = "launch_tab";
    };

    themeFile = "everforest_dark_hard";
    font = {
      name = "JetBrainsMono Nerd Font Mono";
    };
    settings = {
      confirm_os_window_close = 0;
      enable_audio_bell = false;
      mouse_hide_wait = "-1.0";
      background_opacity = 0.95;
      window_padding_width = 4;
      tab_fade = 1;
      active_tab_font_style = "bold";
      inactive_tab_font_style = "bold";

      tab_bar_style = "powerline";
      tab_bar_margin_width = 0;

      linux_display_server = "auto";
      wayland_titlebar_color = "system";

      # #Kanagawa colors
      # #: The basic colors
      #
      # foreground = "#dcd7ba";
      # background = "#1f1f28";
      # selection_foreground = "#c8c093";
      # selection_background = "#2d4f67";
      #
      # #: Cursor colors
      #
      # cursor = "#c8c093";
      #
      # #: URL underline color when overing with mouse
      #
      # url_color = "#72a7bc";
      #
      # #: Tab bar colors
      #
      # active_tab_foreground = "#c8c093";
      # active_tab_background = "#1f1f28";
      # inactive_tab_foreground = "#727169";
      # inactive_tab_background = "#1f1f28";
      #
      # #: The basic 16 colors
      #
      # #: black
      # color0 = "#16161d";
      # color8 = "#727169";
      #
      # #: red
      # color1 = "#c34043";
      # color9 = "#e82424";
      #
      # #: green
      # color2 = "#76946a";
      # color10 = "#98bb6c";
      #
      # #: yellow
      # color3 = "#c0a36e";
      # color11 = "#e6c384";
      #
      # #: blue
      # color4 = "#7e9cd8";
      # color12 = "#7fb4ca";
      #
      # #: magenta
      # color5 = "#957fb8";
      # color13 = "#938aa9";
      #
      # #: cyan
      # color6 = "#6a9589";
      # color14 = "#7aa89f";
      #
      # #: white
      # color7 = "#c8c093";
      # color15 = "#dcd7ba";
      #
      # #: You can set the remaining 240 colors as color16 to color255.
      #
      # color16 = "#ffa066";
      # color17 = "#ff5d62";
    };
  };
}
