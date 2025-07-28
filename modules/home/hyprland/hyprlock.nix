{username, ...}: {
  programs.hyprlock = {
    enable = true;
    settings = {
      general = {
        disable_loading_bar = true;
        grace = 10;
        hide_cursor = true;
        no_fade_in = false;
      };
      background = [
        {
          path = "/home/${username}/Pictures/Wallpapers/streetlights_2.png";
          # blur_passes = 3;
          # blur_size = 8;
        }
      ];
      # image = [
      #   {
      #     path = "/home/${username}/.config/lockscreen_img.png";
      #     size = 150;
      #     border_size = 4;
      #     border_color = "rgb(0C96F9)";
      #     rounding = 0; # Negative means circle
      #     position = "453, 579";
      #     halign = "center";
      #     #valign = "center";
      #   }
      # ];
      input-field = [
        {
          size = "200, 50";
          position = "0, -80";
          monitor = "DP-1";
          dots_center = true;
          fade_on_empty = true;
          font_color = "rgb(CFE6F4)";
          inner_color = "rgb(657DC2)";
          outer_color = "rgb(0D0E15)";
          outline_thickness = 4;
          placeholder_text = "Password...";
          shadow_passes = 2;
        }
      ];
    };
  };
}
