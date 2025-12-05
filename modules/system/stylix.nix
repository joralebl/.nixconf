{pkgs, ...}: {
  stylix = {
    enable = true;
    base16Scheme = "${pkgs.base16-schemes}/share/themes/dracula.yaml";
    # base16Scheme = {
    #   base00 = "2b3339";
    #   base01 = "323c41";
    #   base02 = "503946";
    #   base03 = "868d80";
    #   base04 = "d3c6aa";
    #   base05 = "d3c6aa";
    #   base06 = "e9e8d2";
    #   base07 = "fff9e8";
    #   base08 = "7fbbb3";
    #   base09 = "d699b6";
    #   base0A = "83c092";
    #   base0B = "dbbc7f";
    #   base0C = "e69875";
    #   base0D = "a7c080";
    #   base0E = "e67e80";
    #   base0F = "d699b6";
    # };

    # polarity = "dark";
    cursor = {
      package = pkgs.bibata-cursors;
      name = "Bibata-Modern-Ice";
      size = 24;
    };
    fonts = {
      monospace = {
        package = pkgs.nerd-fonts.jetbrains-mono;
        name = "JetBrains Mono Nerd Font";
      };
      sansSerif = {
        package = pkgs.noto-fonts;
        name = "Noto Sans";
      };
      serif = {
        package = pkgs.noto-fonts;
        name = "Noto Serif";
      };
      emoji = {
        package = pkgs.noto-fonts-monochrome-emoji;
        name = "Noto Emoji";
      };
    };
  };
}
