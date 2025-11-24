{pkgs, ...}: {
  fonts = {
    packages = with pkgs; [
      font-awesome
      noto-fonts
      noto-fonts-emoji
      noto-fonts-cjk-sans
      material-icons
      nerd-fonts.jetbrains-mono
    ];
  };
}
