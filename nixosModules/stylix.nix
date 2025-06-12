{pkgs, ...}: {
  stylix = {
    enable = true;
    #base16Scheme = "${pkgs.base16-schemes}/share/themes/ayu-dark.yaml";
    base16Scheme = {
      base00 = "181616";
      base01 = "0d0c0c";
      base02 = "2d4f67";
      base03 = "a6a69c";
      base04 = "7fb4ca";
      base05 = "c5c9c5";
      base06 = "938aa9";
      base07 = "c5c9c5";
      base08 = "c4746e";
      base09 = "e46876";
      base0A = "c4b28a";
      base0B = "8a9a7b";
      base0C = "8ea4a2";
      base0D = "8ba4b0";
      base0E = "a292a3";
      base0F = "7aa89f";
    };

    image = ../wallpapers/eizensuzuki2.png;
    polarity = "dark";
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
