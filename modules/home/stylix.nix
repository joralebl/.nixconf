{
  pkgs,
  ...
}
: {
  stylix = {
    base16Scheme = ../../colors16.yaml;
	polarity = "dark";
    autoEnable = false;
    targets = {
      bat.enable = true;
      nixos-icons.enable = true;
      niri.enable = true;
    };
    icons = {
      enable = false;
      package = pkgs.flat-remix-icon-theme;
      dark = "Flat-Remix-Green-Dark";
    }; 
	cursor = {
      package = pkgs.bibata-cursors;
      name = "Bibata-Modern-Ice";
      size = 24;
    };
    fonts = {
      monospace = {
        package = pkgs.nerd-fonts.fira-code;
        name = "FiraCode Nerd Font Mono";
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
        package = pkgs.noto-fonts-color-emoji;
        name = "Noto Color Emoji";
      };
    };
  };
}
