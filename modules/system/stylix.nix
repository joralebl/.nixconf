{pkgs, ...}: {
  stylix = {
    enable = true;
    autoEnable = false;
    base16Scheme = ../../colors16.yaml;
	polarity = "dark";
	targets = {
		console.enable = true;
		regreet.enable = true;
		nixos-icons.enable = true;
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
