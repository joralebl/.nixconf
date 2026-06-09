{ pkgs, ... }:
{
  fonts = {
    fontDir.enable = true;
    packages = with pkgs; [
      noto-fonts
      noto-fonts-color-emoji
      noto-fonts-cjk-sans
      noto-fonts-lgc-plus
      nerd-fonts.fira-code
      nerd-fonts.iosevka
      nerd-fonts.hack
      dejavu_fonts
      material-icons
      cantarell-fonts
      open-fonts
    ];
  };
}
