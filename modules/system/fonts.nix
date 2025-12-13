{pkgs, ...}: {
  fonts = {
    packages = with pkgs; [
      noto-fonts
      noto-fonts-monochrome-emoji
      noto-fonts-extra
      noto-fonts-cjk-sans
      material-icons
      nerd-fonts.jetbrains-mono
	  nerd-fonts.fira-code
	  nerd-fonts.iosevka
	  nerd-fonts.hack
      dejavu_fonts
	  material-symbols
    ];
  };
}
